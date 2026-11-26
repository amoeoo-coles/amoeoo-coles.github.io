# 177 · resource aci_spine_interface_profile · 2. Access policies
# Manages ACI Spine Interface Profile
# APIC class: infraSpAccPortP · DN: uni/infra/spaccportprof-{name}
# Reads models/aci_spine_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_177 = yamldecode(file("${path.module}/../models/aci_spine_interface_profile.yml"))["aci_spine_interface_profile"]
}

resource "aci_spine_interface_profile" "n177" {
  annotation  = local.m_177["annotation"]
  annotations = local.m_177["annotations"]
  description = local.m_177["description"]
  name        = local.m_177["name"]
  name_alias  = local.m_177["name_alias"]
  owner_key   = local.m_177["owner_key"]
  owner_tag   = local.m_177["owner_tag"]
  tags        = local.m_177["tags"]
}
