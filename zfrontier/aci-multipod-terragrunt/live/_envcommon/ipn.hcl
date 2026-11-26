# Shared inputs for ipn units. Included by live/<env>/.../ipn/terragrunt.hcl.
locals {
  model = yamldecode(file("${get_repo_root()}/data/sample.yml"))
  env   = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  environment   = local.env.locals.environment
  apic_url      = local.env.locals.apic_url
  ndo_url       = local.env.locals.ndo_url
  nxos_url      = local.env.locals.nxos_url
  apic_username = get_env("TF_VAR_apic_username", "apic_admin")
  apic_password = get_env("TF_VAR_apic_password", "")
  ndo_username  = get_env("TF_VAR_ndo_username", "ndo_admin")
  ndo_password  = get_env("TF_VAR_ndo_password", "")
  nxos_username = get_env("TF_VAR_nxos_username", "admin")
  nxos_password = get_env("TF_VAR_nxos_password", "")
}
