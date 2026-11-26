# 410 · resource aci_rogue_coop_exception · 3. Tenant and networking
# Manages ACI Rogue Coop Exception
# APIC class: fvRogueExceptionMac · DN: uni/tn-{name}/BD-{name}/rgexpmac-{mac}
# Reads models/aci_rogue_coop_exception.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_410 = yamldecode(file("${path.module}/../models/aci_rogue_coop_exception.yml"))["aci_rogue_coop_exception"]
}

resource "aci_rogue_coop_exception" "n410" {
  annotation  = local.m_410["annotation"]
  annotations = local.m_410["annotations"]
  description = local.m_410["description"]
  mac         = local.m_410["mac"]
  name        = local.m_410["name"]
  name_alias  = local.m_410["name_alias"]
  parent_dn   = local.m_410["parent_dn"]
  tags        = local.m_410["tags"]
}
