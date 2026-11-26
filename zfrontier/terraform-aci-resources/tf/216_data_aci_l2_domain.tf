# 216 · data source aci_l2_domain · 2. Access policies
# Data source for ACI L2 Domain
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l2_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_216 = yamldecode(file("${path.module}/../models/data_aci_l2_domain.yml"))["data_aci_l2_domain"]
}

data "aci_l2_domain" "n216" {
  annotation = local.m_216["annotation"]
  name       = local.m_216["name"]
  name_alias = local.m_216["name_alias"]
}

output "n216_data_aci_l2_domain_id" {
  value = data.aci_l2_domain.n216.id
}
