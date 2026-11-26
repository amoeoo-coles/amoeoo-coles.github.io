include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path   = "${get_repo_root()}/live/_envcommon/fabric.hcl"
  expose = true
}

terraform {
  source = "${get_repo_root()}/modules/fabric"
}

locals {
  model = yamldecode(file("${get_repo_root()}/data/sample.yml"))
  env   = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

dependency "infra" {
  config_path = "../../shared/infra"

  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
  mock_outputs = {
    tep_pool     = "10.10.0.0/16"
    fabric_ready = true
  }
}

dependency "ipn" {
  config_path = "../../shared/ipn"

  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
  mock_outputs = {
    wan_vrf = "ACI-IPN"
  }
}

inputs = merge(
  try(include.envcommon.inputs, {}),
  try(local.model.forms, {}),
  {
    environment  = local.env.locals.environment
    location     = "pod1"
    tep_pool     = dependency.infra.outputs.tep_pool
    fabric_ready = dependency.infra.outputs.fabric_ready
    wan_vrf      = dependency.ipn.outputs.wan_vrf
  }
)
