# 651 · resource aci_cloud_vrf_leak_routes · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Inter-VRF Leaked Routes
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_vrf_leak_routes.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_651 = yamldecode(file("${path.module}/../models/aci_cloud_vrf_leak_routes.yml"))["aci_cloud_vrf_leak_routes"]
}

resource "aci_cloud_vrf_leak_routes" "n651" {
  annotation  = local.m_651["annotation"]
  description = local.m_651["description"]
  name_alias  = local.m_651["name_alias"]
  vrf_dn      = local.m_651["vrf_dn"]
  dynamic "leak_to" {
    for_each = local.m_651["leak_to"] == null ? [] : local.m_651["leak_to"]
    content {
      vrf_dn = lookup(leak_to.value, "vrf_dn", null)
    }
  }
}
