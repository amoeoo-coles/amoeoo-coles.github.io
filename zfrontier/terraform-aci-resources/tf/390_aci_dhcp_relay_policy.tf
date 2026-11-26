# 390 · resource aci_dhcp_relay_policy · 3. Tenant and networking
# Manages ACI DHCP Relay Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_dhcp_relay_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_390 = yamldecode(file("${path.module}/../models/aci_dhcp_relay_policy.yml"))["aci_dhcp_relay_policy"]
}

resource "aci_dhcp_relay_policy" "n390" {
  annotation  = local.m_390["annotation"]
  description = local.m_390["description"]
  mode        = local.m_390["mode"]
  name        = local.m_390["name"]
  name_alias  = local.m_390["name_alias"]
  owner       = local.m_390["owner"]
  tenant_dn   = local.m_390["tenant_dn"]
  dynamic "relation_dhcp_rs_prov" {
    for_each = local.m_390["relation_dhcp_rs_prov"] == null ? [] : local.m_390["relation_dhcp_rs_prov"]
    content {
      addr = lookup(relation_dhcp_rs_prov.value, "addr", null)
      tdn  = lookup(relation_dhcp_rs_prov.value, "tdn", null)
    }
  }
}
