# 384 · resource sdwan_policer_policy_object · 10. (Classic) policy objects
# This resource can manage a Policer Policy Object .
# Reads models/sdwan_policer_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_384 = yamldecode(file("${path.module}/../models/sdwan_policer_policy_object.yml"))["sdwan_policer_policy_object"]
}

resource "sdwan_policer_policy_object" "n384" {
  burst         = local.m_384["burst"]
  exceed_action = local.m_384["exceed_action"]
  name          = local.m_384["name"]
  rate          = local.m_384["rate"]
}
