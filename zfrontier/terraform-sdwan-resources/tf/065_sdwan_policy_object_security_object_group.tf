# 065 · resource sdwan_policy_object_security_object_group · 3. Policy objects and custom applications
# This resource can manage a Policy Object Security Object Group Policy_object. Minimum SD-WAN Manager version: 20.18.2
# Reads models/sdwan_policy_object_security_object_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_065 = yamldecode(file("${path.module}/../models/sdwan_policy_object_security_object_group.yml"))["sdwan_policy_object_security_object_group"]
}

resource "sdwan_policy_object_security_object_group" "n065" {
  description = local.m_065["description"]
  entries = local.m_065["entries"]
  feature_profile_id = local.m_065["feature_profile_id"]
  name = local.m_065["name"]
  sequence_ip_type = local.m_065["sequence_ip_type"]
}
