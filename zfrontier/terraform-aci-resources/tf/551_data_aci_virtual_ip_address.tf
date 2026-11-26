# 551 · data source aci_virtual_ip_address · 4. Application
# Data source for ACI Virtual IP Address
# APIC class: fvVip · DN: uni/tn-{name}/ap-{name}/epg-{name}/vip-[{addr}]
# Reads models/data_aci_virtual_ip_address.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_551 = yamldecode(file("${path.module}/../models/data_aci_virtual_ip_address.yml"))["data_aci_virtual_ip_address"]
}

data "aci_virtual_ip_address" "n551" {
  ip        = local.m_551["ip"]
  parent_dn = local.m_551["parent_dn"]
}

output "n551_data_aci_virtual_ip_address_id" {
  value = data.aci_virtual_ip_address.n551.id
}
