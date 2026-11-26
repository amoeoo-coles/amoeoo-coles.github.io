# 565 · data source aci_contract · 4. Application
# Data source for ACI Contract
# APIC class: not collected · DN: not collected
# Reads models/data_aci_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_565 = yamldecode(file("${path.module}/../models/data_aci_contract.yml"))["data_aci_contract"]
}

data "aci_contract" "n565" {
  annotation  = local.m_565["annotation"]
  description = local.m_565["description"]
  name        = local.m_565["name"]
  name_alias  = local.m_565["name_alias"]
  prio        = local.m_565["prio"]
  scope       = local.m_565["scope"]
  target_dscp = local.m_565["target_dscp"]
  tenant_dn   = local.m_565["tenant_dn"]
}

output "n565_data_aci_contract_id" {
  value = data.aci_contract.n565.id
}
