# 486 · data source aci_l3out_static_route · 3. Tenant and networking
# Data source for ACI L3out Static Route
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_static_route.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_486 = yamldecode(file("${path.module}/../models/data_aci_l3out_static_route.yml"))["data_aci_l3out_static_route"]
}

data "aci_l3out_static_route" "n486" {
  aggregate      = local.m_486["aggregate"]
  annotation     = local.m_486["annotation"]
  description    = local.m_486["description"]
  fabric_node_dn = local.m_486["fabric_node_dn"]
  ip             = local.m_486["ip"]
  name_alias     = local.m_486["name_alias"]
  pref           = local.m_486["pref"]
  rt_ctrl        = local.m_486["rt_ctrl"]
}

output "n486_data_aci_l3out_static_route_id" {
  value = data.aci_l3out_static_route.n486.id
}
