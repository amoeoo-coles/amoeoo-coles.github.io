# 065 · data source aci_tacacs_accounting_destination · 1. System and fabric setup
# Data source for ACI TACACS Accounting Destination
# APIC class: not collected · DN: not collected
# Reads models/data_aci_tacacs_accounting_destination.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_065 = yamldecode(file("${path.module}/../models/data_aci_tacacs_accounting_destination.yml"))["data_aci_tacacs_accounting_destination"]
}

data "aci_tacacs_accounting_destination" "n065" {
  annotation           = local.m_065["annotation"]
  auth_protocol        = local.m_065["auth_protocol"]
  description          = local.m_065["description"]
  host                 = local.m_065["host"]
  name                 = local.m_065["name"]
  name_alias           = local.m_065["name_alias"]
  port                 = local.m_065["port"]
  tacacs_accounting_dn = local.m_065["tacacs_accounting_dn"]
}

output "n065_data_aci_tacacs_accounting_destination_id" {
  value = data.aci_tacacs_accounting_destination.n065.id
}
