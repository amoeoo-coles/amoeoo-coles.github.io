# 417 · data source aci_vrf_leak_epg_bd_subnet · 3. Tenant and networking
# Data source for ACI Inter-VRF Leaked EPG/BD Subnet
# APIC class: not collected · DN: not collected
# Reads models/data_aci_vrf_leak_epg_bd_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_417 = yamldecode(file("${path.module}/../models/data_aci_vrf_leak_epg_bd_subnet.yml"))["data_aci_vrf_leak_epg_bd_subnet"]
}

data "aci_vrf_leak_epg_bd_subnet" "n417" {
  allow_l3out_advertisement = local.m_417["allow_l3out_advertisement"]
  annotation                = local.m_417["annotation"]
  description               = local.m_417["description"]
  ip                        = local.m_417["ip"]
  name_alias                = local.m_417["name_alias"]
  vrf_dn                    = local.m_417["vrf_dn"]
  dynamic "leak_to" {
    for_each = local.m_417["leak_to"] == null ? [] : local.m_417["leak_to"]
    content {
      allow_l3out_advertisement = lookup(leak_to.value, "allow_l3out_advertisement", null)
      vrf_dn                    = lookup(leak_to.value, "vrf_dn", null)
    }
  }
}

output "n417_data_aci_vrf_leak_epg_bd_subnet_id" {
  value = data.aci_vrf_leak_epg_bd_subnet.n417.id
}
