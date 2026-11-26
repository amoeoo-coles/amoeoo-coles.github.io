# 063 · resource ise_allowed_protocols_tacacs · 6. Device administration
# This resource can manage a TACACS allowed protocols policy element.
# Reads models/ise_allowed_protocols_tacacs.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_063 = yamldecode(file("${path.module}/../models/ise_allowed_protocols_tacacs.yml"))["ise_allowed_protocols_tacacs"]
}

resource "ise_allowed_protocols_tacacs" "n063" {
  allow_chap = local.m_063["allow_chap"]
  allow_ms_chap_v1 = local.m_063["allow_ms_chap_v1"]
  allow_pap_ascii = local.m_063["allow_pap_ascii"]
  description = local.m_063["description"]
  name = local.m_063["name"]
}
