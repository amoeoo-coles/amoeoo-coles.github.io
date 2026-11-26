# 063 · resource sdwan_policy_object_security_local_domain_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object Security Local Domain List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_security_local_domain_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_063 = yamldecode(file("${path.module}/../models/sdwan_policy_object_security_local_domain_list.yml"))["sdwan_policy_object_security_local_domain_list"]
}

resource "sdwan_policy_object_security_local_domain_list" "n063" {
  description = local.m_063["description"]
  entries = local.m_063["entries"]
  feature_profile_id = local.m_063["feature_profile_id"]
  name = local.m_063["name"]
}
