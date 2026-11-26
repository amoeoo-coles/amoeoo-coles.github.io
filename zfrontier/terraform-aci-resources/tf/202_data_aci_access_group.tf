# 202 · data source aci_access_group · 2. Access policies
# Data source for ACI Access Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_access_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_202 = yamldecode(file("${path.module}/../models/data_aci_access_group.yml"))["data_aci_access_group"]
}

data "aci_access_group" "n202" {
  access_port_selector_dn = local.m_202["access_port_selector_dn"]
  annotation              = local.m_202["annotation"]
  fex_id                  = local.m_202["fex_id"]
  tdn                     = local.m_202["tdn"]
}

output "n202_data_aci_access_group_id" {
  value = data.aci_access_group.n202.id
}
