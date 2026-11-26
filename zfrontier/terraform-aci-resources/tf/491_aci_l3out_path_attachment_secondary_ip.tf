# 491 · resource aci_l3out_path_attachment_secondary_ip · 3. Tenant and networking
# Manages ACI L3-out Path Attachment Secondary IP
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_path_attachment_secondary_ip.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_491 = yamldecode(file("${path.module}/../models/aci_l3out_path_attachment_secondary_ip.yml"))["aci_l3out_path_attachment_secondary_ip"]
}

resource "aci_l3out_path_attachment_secondary_ip" "n491" {
  addr                     = local.m_491["addr"]
  annotation               = local.m_491["annotation"]
  description              = local.m_491["description"]
  dhcp_relay               = local.m_491["dhcp_relay"]
  ipv6_dad                 = local.m_491["ipv6_dad"]
  l3out_path_attachment_dn = local.m_491["l3out_path_attachment_dn"]
  name_alias               = local.m_491["name_alias"]
}
