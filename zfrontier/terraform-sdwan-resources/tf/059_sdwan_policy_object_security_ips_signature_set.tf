# 059 · resource sdwan_policy_object_security_ips_signature_set · 3. Policy objects and custom applications
# This resource can manage a Policy Object Security IPS Signature Set Policy_object. Minimum SD-WAN Manager version: 20.18.1
# Reads models/sdwan_policy_object_security_ips_signature_set.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_059 = yamldecode(file("${path.module}/../models/sdwan_policy_object_security_ips_signature_set.yml"))["sdwan_policy_object_security_ips_signature_set"]
}

resource "sdwan_policy_object_security_ips_signature_set" "n059" {
  description = local.m_059["description"]
  entries = local.m_059["entries"]
  feature_profile_id = local.m_059["feature_profile_id"]
  name = local.m_059["name"]
}
