# 070 · resource aci_tacacs_source · 1. System and fabric setup
# Manages ACI TACACS Source
# APIC class: not collected · DN: not collected
# Reads models/aci_tacacs_source.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_070 = yamldecode(file("${path.module}/../models/aci_tacacs_source.yml"))["aci_tacacs_source"]
}

resource "aci_tacacs_source" "n070" {
  annotation                    = local.m_070["annotation"]
  description                   = local.m_070["description"]
  incl                          = local.m_070["incl"]
  min_sev                       = local.m_070["min_sev"]
  name                          = local.m_070["name"]
  name_alias                    = local.m_070["name_alias"]
  parent_dn                     = local.m_070["parent_dn"]
  relation_tacacs_rs_dest_group = local.m_070["relation_tacacs_rs_dest_group"]
}
