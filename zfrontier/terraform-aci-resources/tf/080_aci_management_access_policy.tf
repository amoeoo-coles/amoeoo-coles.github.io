# 080 · resource aci_management_access_policy · 1. System and fabric setup
# Manages ACI Management Access Policy
# APIC class: commPol · DN: uni/fabric/comm-{name}
# Reads models/aci_management_access_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_080 = yamldecode(file("${path.module}/../models/aci_management_access_policy.yml"))["aci_management_access_policy"]
}

resource "aci_management_access_policy" "n080" {
  annotation                         = local.m_080["annotation"]
  annotations                        = local.m_080["annotations"]
  description                        = local.m_080["description"]
  http_service                       = local.m_080["http_service"]
  http_ssl_configuration             = local.m_080["http_ssl_configuration"]
  name                               = local.m_080["name"]
  name_alias                         = local.m_080["name_alias"]
  owner_key                          = local.m_080["owner_key"]
  owner_tag                          = local.m_080["owner_tag"]
  ssh_access_via_web                 = local.m_080["ssh_access_via_web"]
  ssh_service                        = local.m_080["ssh_service"]
  strict_security_on_apic_oob_subnet = local.m_080["strict_security_on_apic_oob_subnet"]
  tags                               = local.m_080["tags"]
  telnet_service                     = local.m_080["telnet_service"]
}
