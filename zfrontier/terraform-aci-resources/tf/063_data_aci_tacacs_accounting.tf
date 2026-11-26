# 063 · data source aci_tacacs_accounting · 1. System and fabric setup
# Data source for ACI TACACS Accounting
# APIC class: not collected · DN: not collected
# Reads models/data_aci_tacacs_accounting.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_063 = yamldecode(file("${path.module}/../models/data_aci_tacacs_accounting.yml"))["data_aci_tacacs_accounting"]
}

data "aci_tacacs_accounting" "n063" {
  annotation  = local.m_063["annotation"]
  description = local.m_063["description"]
  name        = local.m_063["name"]
  name_alias  = local.m_063["name_alias"]
}

output "n063_data_aci_tacacs_accounting_id" {
  value = data.aci_tacacs_accounting.n063.id
}
