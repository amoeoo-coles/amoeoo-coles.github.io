# 017 · resource aci_port_tracking · 1. System and fabric setup
# Manages ACI Port Tracking
# APIC class: not collected · DN: not collected
# Reads models/aci_port_tracking.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_017 = yamldecode(file("${path.module}/../models/aci_port_tracking.yml"))["aci_port_tracking"]
}

resource "aci_port_tracking" "n017" {
  admin_st           = local.m_017["admin_st"]
  annotation         = local.m_017["annotation"]
  delay              = local.m_017["delay"]
  description        = local.m_017["description"]
  include_apic_ports = local.m_017["include_apic_ports"]
  minlinks           = local.m_017["minlinks"]
  name_alias         = local.m_017["name_alias"]
}
