# 484 · data source aci_l3out_path_attachment · 3. Tenant and networking
# Data source for ACI L3-out Path Attachment
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_path_attachment.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_484 = yamldecode(file("${path.module}/../models/data_aci_l3out_path_attachment.yml"))["data_aci_l3out_path_attachment"]
}

data "aci_l3out_path_attachment" "n484" {
  addr                         = local.m_484["addr"]
  annotation                   = local.m_484["annotation"]
  autostate                    = local.m_484["autostate"]
  description                  = local.m_484["description"]
  encap                        = local.m_484["encap"]
  encap_scope                  = local.m_484["encap_scope"]
  if_inst_t                    = local.m_484["if_inst_t"]
  ipv6_dad                     = local.m_484["ipv6_dad"]
  ll_addr                      = local.m_484["ll_addr"]
  logical_interface_profile_dn = local.m_484["logical_interface_profile_dn"]
  mac                          = local.m_484["mac"]
  mode                         = local.m_484["mode"]
  mtu                          = local.m_484["mtu"]
  target_dn                    = local.m_484["target_dn"]
  target_dscp                  = local.m_484["target_dscp"]
}

output "n484_data_aci_l3out_path_attachment_id" {
  value = data.aci_l3out_path_attachment.n484.id
}
