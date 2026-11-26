# 191 · resource aci_copp_interface_protocol_policy · 2. Access policies
# Manages ACI CoPP Interface Protocol Policy
# APIC class: coppProtoClassP · DN: uni/infra/coppifpol-{name}/protoclassp-{name}
# Reads models/aci_copp_interface_protocol_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_191 = yamldecode(file("${path.module}/../models/aci_copp_interface_protocol_policy.yml"))["aci_copp_interface_protocol_policy"]
}

resource "aci_copp_interface_protocol_policy" "n191" {
  annotation      = local.m_191["annotation"]
  annotations     = local.m_191["annotations"]
  burst           = local.m_191["burst"]
  description     = local.m_191["description"]
  match_protocols = local.m_191["match_protocols"]
  name            = local.m_191["name"]
  name_alias      = local.m_191["name_alias"]
  owner_key       = local.m_191["owner_key"]
  owner_tag       = local.m_191["owner_tag"]
  parent_dn       = local.m_191["parent_dn"]
  rate            = local.m_191["rate"]
  tags            = local.m_191["tags"]
}
