# 111 · resource aci_interface_blacklist · 1. System and fabric setup
# Manages ACI Out of Service Fabric Path
# APIC class: not collected · DN: not collected
# Reads models/aci_interface_blacklist.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_111 = yamldecode(file("${path.module}/../models/aci_interface_blacklist.yml"))["aci_interface_blacklist"]
}

resource "aci_interface_blacklist" "n111" {
  annotation  = local.m_111["annotation"]
  description = local.m_111["description"]
  fex_id      = local.m_111["fex_id"]
  interface   = local.m_111["interface"]
  node_id     = local.m_111["node_id"]
  pod_id      = local.m_111["pod_id"]
}
