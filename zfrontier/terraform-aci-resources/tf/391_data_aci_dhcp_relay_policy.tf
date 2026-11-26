# 391 · data source aci_dhcp_relay_policy · 3. Tenant and networking
# Data source for ACI DHCP Relay Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_dhcp_relay_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_391 = yamldecode(file("${path.module}/../models/data_aci_dhcp_relay_policy.yml"))["data_aci_dhcp_relay_policy"]
}

data "aci_dhcp_relay_policy" "n391" {
  annotation  = local.m_391["annotation"]
  description = local.m_391["description"]
  mode        = local.m_391["mode"]
  name        = local.m_391["name"]
  name_alias  = local.m_391["name_alias"]
  owner       = local.m_391["owner"]
  tenant_dn   = local.m_391["tenant_dn"]
}

output "n391_data_aci_dhcp_relay_policy_id" {
  value = data.aci_dhcp_relay_policy.n391.id
}
