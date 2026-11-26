# 043 · resource sdwan_policy_object_policer · 3. Policy objects and custom applications
# This resource can manage a Policy Object Policer Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_policer.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_043 = yamldecode(file("${path.module}/../models/sdwan_policy_object_policer.yml"))["sdwan_policy_object_policer"]
}

resource "sdwan_policy_object_policer" "n043" {
  description        = local.m_043["description"]
  entries            = local.m_043["entries"]
  feature_profile_id = local.m_043["feature_profile_id"]
  name               = local.m_043["name"]
}
