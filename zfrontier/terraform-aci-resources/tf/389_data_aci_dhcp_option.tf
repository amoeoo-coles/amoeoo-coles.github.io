# 389 · data source aci_dhcp_option · 3. Tenant and networking
# Data source for ACI DHCP Option
# APIC class: not collected · DN: not collected
# Reads models/data_aci_dhcp_option.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_389 = yamldecode(file("${path.module}/../models/data_aci_dhcp_option.yml"))["data_aci_dhcp_option"]
}

data "aci_dhcp_option" "n389" {
  annotation            = local.m_389["annotation"]
  data                  = local.m_389["data"]
  dhcp_option_id        = local.m_389["dhcp_option_id"]
  dhcp_option_policy_dn = local.m_389["dhcp_option_policy_dn"]
  name                  = local.m_389["name"]
  name_alias            = local.m_389["name_alias"]
}

output "n389_data_aci_dhcp_option_id" {
  value = data.aci_dhcp_option.n389.id
}
