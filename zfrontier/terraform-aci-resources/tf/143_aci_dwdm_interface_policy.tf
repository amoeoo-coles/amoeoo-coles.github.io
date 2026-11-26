# 143 · resource aci_dwdm_interface_policy · 2. Access policies
# Manages ACI DWDM Interface Policy
# APIC class: dwdmIfPol · DN: uni/infra/dwdmifpol-{name}
# Reads models/aci_dwdm_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_143 = yamldecode(file("${path.module}/../models/aci_dwdm_interface_policy.yml"))["aci_dwdm_interface_policy"]
}

resource "aci_dwdm_interface_policy" "n143" {
  annotation      = local.m_143["annotation"]
  annotations     = local.m_143["annotations"]
  channel_nummber = local.m_143["channel_nummber"]
  description     = local.m_143["description"]
  name            = local.m_143["name"]
  name_alias      = local.m_143["name_alias"]
  owner_key       = local.m_143["owner_key"]
  owner_tag       = local.m_143["owner_tag"]
  tags            = local.m_143["tags"]
}
