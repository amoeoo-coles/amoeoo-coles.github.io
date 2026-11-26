# 483 · resource aci_l3out_path_attachment · 3. Tenant and networking
# Manages ACI L3-out Path Attachment
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_path_attachment.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_483 = yamldecode(file("${path.module}/../models/aci_l3out_path_attachment.yml"))["aci_l3out_path_attachment"]
}

resource "aci_l3out_path_attachment" "n483" {
  addr                         = local.m_483["addr"]
  annotation                   = local.m_483["annotation"]
  autostate                    = local.m_483["autostate"]
  description                  = local.m_483["description"]
  encap                        = local.m_483["encap"]
  encap_scope                  = local.m_483["encap_scope"]
  if_inst_t                    = local.m_483["if_inst_t"]
  ipv6_dad                     = local.m_483["ipv6_dad"]
  ll_addr                      = local.m_483["ll_addr"]
  logical_interface_profile_dn = local.m_483["logical_interface_profile_dn"]
  mac                          = local.m_483["mac"]
  mode                         = local.m_483["mode"]
  mtu                          = local.m_483["mtu"]
  target_dn                    = local.m_483["target_dn"]
  target_dscp                  = local.m_483["target_dscp"]
}
