# 175 · resource aci_spanning_tree_interface_policy · 2. Access policies
# Manages ACI Spanning Tree Interface Policy
# APIC class: stpIfPol · DN: uni/infra/ifPol-{name}
# Reads models/aci_spanning_tree_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_175 = yamldecode(file("${path.module}/../models/aci_spanning_tree_interface_policy.yml"))["aci_spanning_tree_interface_policy"]
}

resource "aci_spanning_tree_interface_policy" "n175" {
  annotation         = local.m_175["annotation"]
  annotations        = local.m_175["annotations"]
  ctrl               = local.m_175["ctrl"]
  description        = local.m_175["description"]
  interface_controls = local.m_175["interface_controls"]
  name               = local.m_175["name"]
  name_alias         = local.m_175["name_alias"]
  owner_key          = local.m_175["owner_key"]
  owner_tag          = local.m_175["owner_tag"]
  tags               = local.m_175["tags"]
}
