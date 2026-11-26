# 652 · data source aci_cloud_vrf_leak_routes · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Inter-VRF Leaked Routes
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_vrf_leak_routes.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_652 = yamldecode(file("${path.module}/../models/data_aci_cloud_vrf_leak_routes.yml"))["data_aci_cloud_vrf_leak_routes"]
}

data "aci_cloud_vrf_leak_routes" "n652" {
  annotation  = local.m_652["annotation"]
  description = local.m_652["description"]
  name_alias  = local.m_652["name_alias"]
  vrf_dn      = local.m_652["vrf_dn"]
  dynamic "leak_to" {
    for_each = local.m_652["leak_to"] == null ? [] : local.m_652["leak_to"]
    content {
      vrf_dn = lookup(leak_to.value, "vrf_dn", null)
    }
  }
}

output "n652_data_aci_cloud_vrf_leak_routes_id" {
  value = data.aci_cloud_vrf_leak_routes.n652.id
}
