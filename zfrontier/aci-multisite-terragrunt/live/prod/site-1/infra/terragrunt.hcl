include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path   = "${get_repo_root()}/live/_envcommon/infra.hcl"
  expose = true
}

terraform {
  source = "${get_repo_root()}/modules/infra"
}

locals {
  model = yamldecode(file("${get_repo_root()}/data/sample.yml"))
  env   = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}


inputs = merge(
  try(include.envcommon.inputs, {}),
  try(local.model.forms, {}),
  {
    environment = local.env.locals.environment
    location    = "site-1"
  }
)
