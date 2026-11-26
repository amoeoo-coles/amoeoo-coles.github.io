# 412 · resource aci_subnet · 3. Tenant and networking
# Manages ACI Subnet
# APIC class: not collected · DN: not collected
# Reads models/aci_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_412 = yamldecode(file("${path.module}/../models/aci_subnet.yml"))["aci_subnet"]
}

resource "aci_subnet" "n412" {
  annotation                          = local.m_412["annotation"]
  anycast_mac                         = local.m_412["anycast_mac"]
  ctrl                                = local.m_412["ctrl"]
  description                         = local.m_412["description"]
  ip                                  = local.m_412["ip"]
  ip_data_plane_learning              = local.m_412["ip_data_plane_learning"]
  name_alias                          = local.m_412["name_alias"]
  next_hop_addr                       = local.m_412["next_hop_addr"]
  parent_dn                           = local.m_412["parent_dn"]
  preferred                           = local.m_412["preferred"]
  relation_fv_rs_bd_subnet_to_out     = local.m_412["relation_fv_rs_bd_subnet_to_out"]
  relation_fv_rs_bd_subnet_to_profile = local.m_412["relation_fv_rs_bd_subnet_to_profile"]
  relation_fv_rs_nd_pfx_pol           = local.m_412["relation_fv_rs_nd_pfx_pol"]
  scope                               = local.m_412["scope"]
  virtual                             = local.m_412["virtual"]
  dynamic "msnlb" {
    for_each = local.m_412["msnlb"] == null ? [] : local.m_412["msnlb"]
    content {
      group = lookup(msnlb.value, "group", null)
      mac   = lookup(msnlb.value, "mac", null)
      mode  = lookup(msnlb.value, "mode", null)
    }
  }
}
