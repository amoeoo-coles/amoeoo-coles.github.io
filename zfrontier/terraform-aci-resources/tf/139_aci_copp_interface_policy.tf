# 139 · resource aci_copp_interface_policy · 2. Access policies
# Manages ACI CoPP Interface Policy
# APIC class: coppIfPol · DN: uni/infra/coppifpol-{name}
# Reads models/aci_copp_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_139 = yamldecode(file("${path.module}/../models/aci_copp_interface_policy.yml"))["aci_copp_interface_policy"]
}

resource "aci_copp_interface_policy" "n139" {
  annotation        = local.m_139["annotation"]
  annotations       = local.m_139["annotations"]
  description       = local.m_139["description"]
  name              = local.m_139["name"]
  name_alias        = local.m_139["name_alias"]
  owner_key         = local.m_139["owner_key"]
  owner_tag         = local.m_139["owner_tag"]
  protocol_policies = local.m_139["protocol_policies"]
  tags              = local.m_139["tags"]
}
