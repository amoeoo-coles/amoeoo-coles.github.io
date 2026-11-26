# 079 · resource sdwan_policy_object_security_zone · 3. Policy objects and custom applications
# This resource can manage a Policy Object Security Zone Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_security_zone.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_079 = yamldecode(file("${path.module}/../models/sdwan_policy_object_security_zone.yml"))["sdwan_policy_object_security_zone"]
}

resource "sdwan_policy_object_security_zone" "n079" {
  description = local.m_079["description"]
  entries = local.m_079["entries"]
  feature_profile_id = local.m_079["feature_profile_id"]
  name = local.m_079["name"]
}
