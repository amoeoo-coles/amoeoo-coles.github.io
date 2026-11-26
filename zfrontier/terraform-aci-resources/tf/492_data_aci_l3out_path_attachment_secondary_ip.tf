# 492 · data source aci_l3out_path_attachment_secondary_ip · 3. Tenant and networking
# Data source for ACI L3-out Path Attachment Secondary IP
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_path_attachment_secondary_ip.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_492 = yamldecode(file("${path.module}/../models/data_aci_l3out_path_attachment_secondary_ip.yml"))["data_aci_l3out_path_attachment_secondary_ip"]
}

data "aci_l3out_path_attachment_secondary_ip" "n492" {
  addr                     = local.m_492["addr"]
  annotation               = local.m_492["annotation"]
  description              = local.m_492["description"]
  dhcp_relay               = local.m_492["dhcp_relay"]
  ipv6_dad                 = local.m_492["ipv6_dad"]
  l3out_path_attachment_dn = local.m_492["l3out_path_attachment_dn"]
  name_alias               = local.m_492["name_alias"]
}

output "n492_data_aci_l3out_path_attachment_secondary_ip_id" {
  value = data.aci_l3out_path_attachment_secondary_ip.n492.id
}
