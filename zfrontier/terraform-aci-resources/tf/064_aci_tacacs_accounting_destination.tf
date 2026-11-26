# 064 · resource aci_tacacs_accounting_destination · 1. System and fabric setup
# Manages ACI TACACS Accounting Destination
# APIC class: not collected · DN: not collected
# Reads models/aci_tacacs_accounting_destination.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_064 = yamldecode(file("${path.module}/../models/aci_tacacs_accounting_destination.yml"))["aci_tacacs_accounting_destination"]
}

resource "aci_tacacs_accounting_destination" "n064" {
  annotation                            = local.m_064["annotation"]
  auth_protocol                         = local.m_064["auth_protocol"]
  description                           = local.m_064["description"]
  host                                  = local.m_064["host"]
  key                                   = local.m_064["key"]
  name                                  = local.m_064["name"]
  name_alias                            = local.m_064["name_alias"]
  port                                  = local.m_064["port"]
  relation_file_rs_a_remote_host_to_epg = local.m_064["relation_file_rs_a_remote_host_to_epg"]
  relation_file_rs_a_remote_host_to_epp = local.m_064["relation_file_rs_a_remote_host_to_epp"]
  tacacs_accounting_dn                  = local.m_064["tacacs_accounting_dn"]
}
