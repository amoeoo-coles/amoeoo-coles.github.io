# 413 · data source aci_subnet · 3. Tenant and networking
# Data source for ACI Subnet
# APIC class: not collected · DN: not collected
# Reads models/data_aci_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_413 = yamldecode(file("${path.module}/../models/data_aci_subnet.yml"))["data_aci_subnet"]
}

data "aci_subnet" "n413" {
  annotation    = local.m_413["annotation"]
  anycast_mac   = local.m_413["anycast_mac"]
  description   = local.m_413["description"]
  ip            = local.m_413["ip"]
  next_hop_addr = local.m_413["next_hop_addr"]
  parent_dn     = local.m_413["parent_dn"]
  dynamic "msnlb" {
    for_each = local.m_413["msnlb"] == null ? [] : local.m_413["msnlb"]
    content {
      group = lookup(msnlb.value, "group", null)
      mac   = lookup(msnlb.value, "mac", null)
      mode  = lookup(msnlb.value, "mode", null)
    }
  }
}

output "n413_data_aci_subnet_id" {
  value = data.aci_subnet.n413.id
}
