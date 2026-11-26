# 238 · data source aci_multicast_pool · 2. Access policies
# Data source for the ACI Multicast Address Pool
# APIC class: not collected · DN: not collected
# Reads models/data_aci_multicast_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_238 = yamldecode(file("${path.module}/../models/data_aci_multicast_pool.yml"))["data_aci_multicast_pool"]
}

data "aci_multicast_pool" "n238" {
  annotation  = local.m_238["annotation"]
  description = local.m_238["description"]
  name        = local.m_238["name"]
  name_alias  = local.m_238["name_alias"]
  dynamic "multicast_address_block" {
    for_each = local.m_238["multicast_address_block"] == null ? [] : local.m_238["multicast_address_block"]
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

output "n238_data_aci_multicast_pool_id" {
  value = data.aci_multicast_pool.n238.id
}
