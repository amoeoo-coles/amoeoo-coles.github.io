# 145 · resource aci_fex_profile · 2. Access policies
# Manages ACI FEX Profile
# APIC class: infraFexP · DN: uni/infra/fexprof-{name}
# Reads models/aci_fex_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_145 = yamldecode(file("${path.module}/../models/aci_fex_profile.yml"))["aci_fex_profile"]
}

resource "aci_fex_profile" "n145" {
  annotation  = local.m_145["annotation"]
  annotations = local.m_145["annotations"]
  description = local.m_145["description"]
  name        = local.m_145["name"]
  name_alias  = local.m_145["name_alias"]
  owner_key   = local.m_145["owner_key"]
  owner_tag   = local.m_145["owner_tag"]
  tags        = local.m_145["tags"]
}
