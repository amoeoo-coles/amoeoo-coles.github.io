# 061 · resource sdwan_policy_object_security_local_application_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object Security Local Application List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_security_local_application_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_061 = yamldecode(file("${path.module}/../models/sdwan_policy_object_security_local_application_list.yml"))["sdwan_policy_object_security_local_application_list"]
}

resource "sdwan_policy_object_security_local_application_list" "n061" {
  description        = local.m_061["description"]
  entries            = local.m_061["entries"]
  feature_profile_id = local.m_061["feature_profile_id"]
  name               = local.m_061["name"]
}
