include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path   = "${get_repo_root()}/live/_envcommon/tenants.hcl"
  expose = true
}

terraform {
  source = "${get_repo_root()}/modules/tenants"
}

locals {
  model = yamldecode(file("${get_repo_root()}/data/sample.yml"))
  env   = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

dependency "fabric_a" {
  config_path = "../../site-1/fabric"

  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
  mock_outputs = {
    fabric_ready = true
    site_name    = "site-1"
  }
}

inputs = merge(
  try(include.envcommon.inputs, {}),
  try(local.model.forms, {}),
  {
    environment  = local.env.locals.environment
    location     = "shared"
    fabric_ready = dependency.fabric_a.outputs.fabric_ready
    site_name    = dependency.fabric_a.outputs.site_name
  }
)
