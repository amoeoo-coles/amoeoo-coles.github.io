# 394 · resource aci_relation_from_bridge_domain_to_l3_outside · 3. Tenant and networking
# Manages ACI Relation From Bridge Domain To L3 Outside
# APIC class: fvRsBDToOut · DN: uni/tn-{name}/BD-{name}/rsBDToOut-{tnL3extOutName} | uni/tn-{name}/rsBDToOut-{tnL3extOutName} | uni/tn-{name}/svcBD-{name}/rsBDToOut-{tnL3extOutName}
# Reads models/aci_relation_from_bridge_domain_to_l3_outside.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_394 = yamldecode(file("${path.module}/../models/aci_relation_from_bridge_domain_to_l3_outside.yml"))["aci_relation_from_bridge_domain_to_l3_outside"]
}

resource "aci_relation_from_bridge_domain_to_l3_outside" "n394" {
  annotation      = local.m_394["annotation"]
  annotations     = local.m_394["annotations"]
  l3_outside_name = local.m_394["l3_outside_name"]
  parent_dn       = local.m_394["parent_dn"]
  tags            = local.m_394["tags"]
}
