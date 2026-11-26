# 703 · resource aci_port_security_policy · 9. Other
# not collected
# APIC class: not collected · DN: not collected
# Reads models/aci_port_security_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_703 = yamldecode(file("${path.module}/../models/aci_port_security_policy.yml"))["aci_port_security_policy"]
}

resource "aci_port_security_policy" "n703" {
  annotation  = local.m_703["annotation"]
  description = local.m_703["description"]
  maximum     = local.m_703["maximum"]
  name        = local.m_703["name"]
  name_alias  = local.m_703["name_alias"]
  timeout     = local.m_703["timeout"]
  violation   = local.m_703["violation"]
}
