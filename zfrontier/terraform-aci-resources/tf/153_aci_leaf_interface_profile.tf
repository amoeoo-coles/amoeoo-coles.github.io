# 153 · resource aci_leaf_interface_profile · 2. Access policies
# Manages ACI Leaf Interface Profile
# APIC class: infraAccPortP · DN: uni/infra/accportprof-{name}
# Reads models/aci_leaf_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_153 = yamldecode(file("${path.module}/../models/aci_leaf_interface_profile.yml"))["aci_leaf_interface_profile"]
}

resource "aci_leaf_interface_profile" "n153" {
  annotation  = local.m_153["annotation"]
  annotations = local.m_153["annotations"]
  description = local.m_153["description"]
  name        = local.m_153["name"]
  name_alias  = local.m_153["name_alias"]
  owner_key   = local.m_153["owner_key"]
  owner_tag   = local.m_153["owner_tag"]
  tags        = local.m_153["tags"]
}
