# 322 · data source aci_hsrp_interface_policy · 3. Tenant and networking
# Data source for ACI HSRP Interface Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_hsrp_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_322 = yamldecode(file("${path.module}/../models/data_aci_hsrp_interface_policy.yml"))["data_aci_hsrp_interface_policy"]
}

data "aci_hsrp_interface_policy" "n322" {
  annotation   = local.m_322["annotation"]
  ctrl         = local.m_322["ctrl"]
  delay        = local.m_322["delay"]
  description  = local.m_322["description"]
  name         = local.m_322["name"]
  name_alias   = local.m_322["name_alias"]
  reload_delay = local.m_322["reload_delay"]
  tenant_dn    = local.m_322["tenant_dn"]
}

output "n322_data_aci_hsrp_interface_policy_id" {
  value = data.aci_hsrp_interface_policy.n322.id
}
