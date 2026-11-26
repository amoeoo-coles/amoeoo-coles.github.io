# 311 · resource aci_dhcp_option_policy · 3. Tenant and networking
# Manages ACI DHCP Option Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_dhcp_option_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_311 = yamldecode(file("${path.module}/../models/aci_dhcp_option_policy.yml"))["aci_dhcp_option_policy"]
}

resource "aci_dhcp_option_policy" "n311" {
  annotation  = local.m_311["annotation"]
  description = local.m_311["description"]
  name        = local.m_311["name"]
  name_alias  = local.m_311["name_alias"]
  tenant_dn   = local.m_311["tenant_dn"]
  dynamic "dhcp_option" {
    for_each = local.m_311["dhcp_option"] == null ? [] : local.m_311["dhcp_option"]
    content {
      annotation     = lookup(dhcp_option.value, "annotation", null)
      data           = lookup(dhcp_option.value, "data", null)
      dhcp_option_id = lookup(dhcp_option.value, "dhcp_option_id", null)
      name           = lookup(dhcp_option.value, "name", null)
      name_alias     = lookup(dhcp_option.value, "name_alias", null)
    }
  }
}
