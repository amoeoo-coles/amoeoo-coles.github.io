# 570 · resource aci_out_of_band_contract · 4. Application
# Manages ACI Out Of Band Contract
# APIC class: vzOOBBrCP · DN: uni/tn-mgmt/oobbrc-{name}
# Reads models/aci_out_of_band_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_570 = yamldecode(file("${path.module}/../models/aci_out_of_band_contract.yml"))["aci_out_of_band_contract"]
}

resource "aci_out_of_band_contract" "n570" {
  annotation  = local.m_570["annotation"]
  annotations = local.m_570["annotations"]
  description = local.m_570["description"]
  intent      = local.m_570["intent"]
  name        = local.m_570["name"]
  name_alias  = local.m_570["name_alias"]
  owner_key   = local.m_570["owner_key"]
  owner_tag   = local.m_570["owner_tag"]
  priority    = local.m_570["priority"]
  scope       = local.m_570["scope"]
  tags        = local.m_570["tags"]
  target_dscp = local.m_570["target_dscp"]
}
