# 057 · resource sdwan_policy_object_security_ips_signature · 3. Policy objects and custom applications
# This resource can manage a Policy Object Security IPS Signature Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_security_ips_signature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_057 = yamldecode(file("${path.module}/../models/sdwan_policy_object_security_ips_signature.yml"))["sdwan_policy_object_security_ips_signature"]
}

resource "sdwan_policy_object_security_ips_signature" "n057" {
  description = local.m_057["description"]
  entries = local.m_057["entries"]
  feature_profile_id = local.m_057["feature_profile_id"]
  name = local.m_057["name"]
}
