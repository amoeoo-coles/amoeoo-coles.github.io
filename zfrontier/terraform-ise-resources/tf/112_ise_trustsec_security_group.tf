# 112 · resource ise_trustsec_security_group · 7. TrustSec
# This resource can manage a TrustSec Security Group.
# Reads models/ise_trustsec_security_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_112 = yamldecode(file("${path.module}/../models/ise_trustsec_security_group.yml"))["ise_trustsec_security_group"]
}

resource "ise_trustsec_security_group" "n112" {
  description       = local.m_112["description"]
  is_read_only      = local.m_112["is_read_only"]
  name              = local.m_112["name"]
  propogate_to_apic = local.m_112["propogate_to_apic"]
  value             = local.m_112["value"]
}
