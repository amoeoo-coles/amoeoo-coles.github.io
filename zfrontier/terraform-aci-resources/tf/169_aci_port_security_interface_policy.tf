# 169 · resource aci_port_security_interface_policy · 2. Access policies
# Manages ACI Port Security Interface Policy
# APIC class: l2PortSecurityPol · DN: uni/infra/portsecurityP-{name}
# Reads models/aci_port_security_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_169 = yamldecode(file("${path.module}/../models/aci_port_security_interface_policy.yml"))["aci_port_security_interface_policy"]
}

resource "aci_port_security_interface_policy" "n169" {
  annotation        = local.m_169["annotation"]
  annotations       = local.m_169["annotations"]
  description       = local.m_169["description"]
  maximum_endpoints = local.m_169["maximum_endpoints"]
  name              = local.m_169["name"]
  name_alias        = local.m_169["name_alias"]
  owner_key         = local.m_169["owner_key"]
  owner_tag         = local.m_169["owner_tag"]
  tags              = local.m_169["tags"]
  timeout           = local.m_169["timeout"]
  violation_action  = local.m_169["violation_action"]
}
