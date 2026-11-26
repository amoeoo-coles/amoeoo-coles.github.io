# 349 · resource aci_netflow_record_policy · 3. Tenant and networking
# Manages ACI NetFlow Record Policy
# APIC class: netflowRecordPol · DN: uni/infra/recordpol-{name} | uni/tn-{name}/recordpol-{name}
# Reads models/aci_netflow_record_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_349 = yamldecode(file("${path.module}/../models/aci_netflow_record_policy.yml"))["aci_netflow_record_policy"]
}

resource "aci_netflow_record_policy" "n349" {
  annotation         = local.m_349["annotation"]
  annotations        = local.m_349["annotations"]
  collect_parameters = local.m_349["collect_parameters"]
  description        = local.m_349["description"]
  match_parameters   = local.m_349["match_parameters"]
  name               = local.m_349["name"]
  name_alias         = local.m_349["name_alias"]
  owner_key          = local.m_349["owner_key"]
  owner_tag          = local.m_349["owner_tag"]
  parent_dn          = local.m_349["parent_dn"]
  tags               = local.m_349["tags"]
}
