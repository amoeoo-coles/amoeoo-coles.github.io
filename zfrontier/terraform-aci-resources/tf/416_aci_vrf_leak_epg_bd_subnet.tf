# 416 · resource aci_vrf_leak_epg_bd_subnet · 3. Tenant and networking
# Manages ACI Inter-VRF Leaked EPG/BD Subnet
# APIC class: not collected · DN: not collected
# Reads models/aci_vrf_leak_epg_bd_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_416 = yamldecode(file("${path.module}/../models/aci_vrf_leak_epg_bd_subnet.yml"))["aci_vrf_leak_epg_bd_subnet"]
}

resource "aci_vrf_leak_epg_bd_subnet" "n416" {
  allow_l3out_advertisement = local.m_416["allow_l3out_advertisement"]
  annotation                = local.m_416["annotation"]
  description               = local.m_416["description"]
  ip                        = local.m_416["ip"]
  name_alias                = local.m_416["name_alias"]
  vrf_dn                    = local.m_416["vrf_dn"]
  dynamic "leak_to" {
    for_each = local.m_416["leak_to"] == null ? [] : local.m_416["leak_to"]
    content {
      allow_l3out_advertisement = lookup(leak_to.value, "allow_l3out_advertisement", null)
      vrf_dn                    = lookup(leak_to.value, "vrf_dn", null)
    }
  }
}
