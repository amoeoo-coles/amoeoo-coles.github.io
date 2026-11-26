# 572 · resource aci_taboo_contract · 4. Application
# Manages ACI Taboo Contract
# APIC class: vzTaboo · DN: uni/tn-{name}/taboo-{name}
# Reads models/aci_taboo_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_572 = yamldecode(file("${path.module}/../models/aci_taboo_contract.yml"))["aci_taboo_contract"]
}

resource "aci_taboo_contract" "n572" {
  annotation  = local.m_572["annotation"]
  annotations = local.m_572["annotations"]
  description = local.m_572["description"]
  name        = local.m_572["name"]
  name_alias  = local.m_572["name_alias"]
  owner_key   = local.m_572["owner_key"]
  owner_tag   = local.m_572["owner_tag"]
  parent_dn   = local.m_572["parent_dn"]
  tags        = local.m_572["tags"]
  tenant_dn   = local.m_572["tenant_dn"]
}
