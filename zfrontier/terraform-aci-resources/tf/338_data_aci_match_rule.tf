# 338 · data source aci_match_rule · 3. Tenant and networking
# Data source for ACI Match Rule
# APIC class: not collected · DN: not collected
# Reads models/data_aci_match_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_338 = yamldecode(file("${path.module}/../models/data_aci_match_rule.yml"))["data_aci_match_rule"]
}

data "aci_match_rule" "n338" {
  annotation  = local.m_338["annotation"]
  description = local.m_338["description"]
  name        = local.m_338["name"]
  name_alias  = local.m_338["name_alias"]
  tenant_dn   = local.m_338["tenant_dn"]
}

output "n338_data_aci_match_rule_id" {
  value = data.aci_match_rule.n338.id
}
