# 028 · data source aci_authentication_properties · 1. System and fabric setup
# Data source for ACI AAA Authentication Properties and Default Radius Authentication Settings
# APIC class: not collected · DN: not collected
# Reads models/data_aci_authentication_properties.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_028 = yamldecode(file("${path.module}/../models/data_aci_authentication_properties.yml"))["data_aci_authentication_properties"]
}

data "aci_authentication_properties" "n028" {
  annotation      = local.m_028["annotation"]
  def_role_policy = local.m_028["def_role_policy"]
  description     = local.m_028["description"]
  name_alias      = local.m_028["name_alias"]
  ping_check      = local.m_028["ping_check"]
  retries         = local.m_028["retries"]
  timeout         = local.m_028["timeout"]
}

output "n028_data_aci_authentication_properties_id" {
  value = data.aci_authentication_properties.n028.id
}
