# 085 · resource sdwan_policy_object_tloc_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object TLOC List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_tloc_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_085 = yamldecode(file("${path.module}/../models/sdwan_policy_object_tloc_list.yml"))["sdwan_policy_object_tloc_list"]
}

resource "sdwan_policy_object_tloc_list" "n085" {
  description = local.m_085["description"]
  entries = local.m_085["entries"]
  feature_profile_id = local.m_085["feature_profile_id"]
  name = local.m_085["name"]
}
