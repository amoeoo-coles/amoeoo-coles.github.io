# 313 · resource aci_eigrp_address_family_context · 3. Tenant and networking
# Manages ACI EIGRP Address Family Context
# APIC class: eigrpCtxAfPol · DN: uni/tn-{name}/eigrpCtxAfP-{name}
# Reads models/aci_eigrp_address_family_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_313 = yamldecode(file("${path.module}/../models/aci_eigrp_address_family_context.yml"))["aci_eigrp_address_family_context"]
}

resource "aci_eigrp_address_family_context" "n313" {
  active_interval    = local.m_313["active_interval"]
  annotation         = local.m_313["annotation"]
  annotations        = local.m_313["annotations"]
  description        = local.m_313["description"]
  external_distance  = local.m_313["external_distance"]
  internal_distance  = local.m_313["internal_distance"]
  maximum_path_limit = local.m_313["maximum_path_limit"]
  metric_style       = local.m_313["metric_style"]
  name               = local.m_313["name"]
  name_alias         = local.m_313["name_alias"]
  owner_key          = local.m_313["owner_key"]
  owner_tag          = local.m_313["owner_tag"]
  parent_dn          = local.m_313["parent_dn"]
  tags               = local.m_313["tags"]
}
