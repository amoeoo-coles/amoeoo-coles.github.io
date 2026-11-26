# 237 · resource aci_multicast_pool · 2. Access policies
# Manages the ACI Multicast Address Pool
# APIC class: not collected · DN: not collected
# Reads models/aci_multicast_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_237 = yamldecode(file("${path.module}/../models/aci_multicast_pool.yml"))["aci_multicast_pool"]
}

resource "aci_multicast_pool" "n237" {
  annotation  = local.m_237["annotation"]
  description = local.m_237["description"]
  name        = local.m_237["name"]
  name_alias  = local.m_237["name_alias"]
  dynamic "multicast_address_block" {
    for_each = local.m_237["multicast_address_block"] == null ? [] : local.m_237["multicast_address_block"]
    content {
      annotation  = lookup(multicast_address_block.value, "annotation", null)
      description = lookup(multicast_address_block.value, "description", null)
      from        = lookup(multicast_address_block.value, "from", null)
      name        = lookup(multicast_address_block.value, "name", null)
      name_alias  = lookup(multicast_address_block.value, "name_alias", null)
      to          = lookup(multicast_address_block.value, "to", null)
    }
  }
}
