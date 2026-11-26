# 007 · resource catalystcenter_integrate_ise · 1. System
# This resource accepts the Cisco ISE server certificate for Cisco ISE integration
# Reads models/catalystcenter_integrate_ise.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_007 = yamldecode(file("${path.module}/../models/catalystcenter_integrate_ise.yml"))["catalystcenter_integrate_ise"]
}

resource "catalystcenter_integrate_ise" "n007" {
  ise_instance_id = local.m_007["ise_instance_id"]
}
