# 277 · resource aci_vmm_credential · 2. Access policies
# Manages ACI VMM Credential
# APIC class: vmmUsrAccP · DN: uni/vmmp-{vendor}/dom-{name}/usracc-{name}
# Reads models/aci_vmm_credential.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_277 = yamldecode(file("${path.module}/../models/aci_vmm_credential.yml"))["aci_vmm_credential"]
}

resource "aci_vmm_credential" "n277" {
  annotation    = local.m_277["annotation"]
  annotations   = local.m_277["annotations"]
  description   = local.m_277["description"]
  name          = local.m_277["name"]
  name_alias    = local.m_277["name_alias"]
  owner_key     = local.m_277["owner_key"]
  owner_tag     = local.m_277["owner_tag"]
  parent_dn     = local.m_277["parent_dn"]
  password      = local.m_277["password"]
  pwd           = local.m_277["pwd"]
  tags          = local.m_277["tags"]
  username      = local.m_277["username"]
  usr           = local.m_277["usr"]
  vmm_domain_dn = local.m_277["vmm_domain_dn"]
}
