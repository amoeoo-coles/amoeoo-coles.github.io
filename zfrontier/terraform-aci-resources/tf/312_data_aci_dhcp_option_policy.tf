# 312 · data source aci_dhcp_option_policy · 3. Tenant and networking
# Data source for ACI DHCP Option Policy.
# APIC class: not collected · DN: not collected
# Reads models/data_aci_dhcp_option_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_312 = yamldecode(file("${path.module}/../models/data_aci_dhcp_option_policy.yml"))["data_aci_dhcp_option_policy"]
}

data "aci_dhcp_option_policy" "n312" {
  annotation  = local.m_312["annotation"]
  description = local.m_312["description"]
  name        = local.m_312["name"]
  name_alias  = local.m_312["name_alias"]
  tenant_dn   = local.m_312["tenant_dn"]
}

output "n312_data_aci_dhcp_option_policy_id" {
  value = data.aci_dhcp_option_policy.n312.id
}
