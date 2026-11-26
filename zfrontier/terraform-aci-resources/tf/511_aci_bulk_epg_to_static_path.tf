# 511 · resource aci_bulk_epg_to_static_path · 4. Application
# Manages ACI EPG to Static Paths in bulk
# APIC class: not collected · DN: not collected
# Reads models/aci_bulk_epg_to_static_path.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_511 = yamldecode(file("${path.module}/../models/aci_bulk_epg_to_static_path.yml"))["aci_bulk_epg_to_static_path"]
}

resource "aci_bulk_epg_to_static_path" "n511" {
  application_epg_dn = local.m_511["application_epg_dn"]
  dynamic "static_path" {
    for_each = local.m_511["static_path"] == null ? [] : local.m_511["static_path"]
    content {
      deployment_immediacy = lookup(static_path.value, "deployment_immediacy", null)
      description          = lookup(static_path.value, "description", null)
      encap                = lookup(static_path.value, "encap", null)
      interface_dn         = lookup(static_path.value, "interface_dn", null)
      mode                 = lookup(static_path.value, "mode", null)
      primary_encap        = lookup(static_path.value, "primary_encap", null)
    }
  }
}
