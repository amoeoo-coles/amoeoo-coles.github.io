# 214 · data source aci_fc_domain · 2. Access policies
# Data source for ACI FC Domain
# APIC class: not collected · DN: not collected
# Reads models/data_aci_fc_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_214 = yamldecode(file("${path.module}/../models/data_aci_fc_domain.yml"))["data_aci_fc_domain"]
}

data "aci_fc_domain" "n214" {
  annotation  = local.m_214["annotation"]
  description = local.m_214["description"]
  name        = local.m_214["name"]
  name_alias  = local.m_214["name_alias"]
}

output "n214_data_aci_fc_domain_id" {
  value = data.aci_fc_domain.n214.id
}
