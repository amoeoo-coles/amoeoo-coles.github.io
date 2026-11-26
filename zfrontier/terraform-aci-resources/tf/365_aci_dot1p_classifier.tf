# 365 · resource aci_dot1p_classifier · 3. Tenant and networking
# Manages ACI Dot1p Classifier
# APIC class: qosDot1PClass · DN: uni/tn-{name}/qoscustom-{name}/dot1P-{from}-{to}
# Reads models/aci_dot1p_classifier.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_365 = yamldecode(file("${path.module}/../models/aci_dot1p_classifier.yml"))["aci_dot1p_classifier"]
}

resource "aci_dot1p_classifier" "n365" {
  annotation  = local.m_365["annotation"]
  annotations = local.m_365["annotations"]
  description = local.m_365["description"]
  from        = local.m_365["from"]
  name        = local.m_365["name"]
  name_alias  = local.m_365["name_alias"]
  parent_dn   = local.m_365["parent_dn"]
  priority    = local.m_365["priority"]
  tags        = local.m_365["tags"]
  target      = local.m_365["target"]
  target_cos  = local.m_365["target_cos"]
  to          = local.m_365["to"]
}
