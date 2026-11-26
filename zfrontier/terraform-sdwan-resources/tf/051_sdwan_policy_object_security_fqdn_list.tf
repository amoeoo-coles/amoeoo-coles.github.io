# 051 · resource sdwan_policy_object_security_fqdn_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object Security FQDN List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_security_fqdn_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_051 = yamldecode(file("${path.module}/../models/sdwan_policy_object_security_fqdn_list.yml"))["sdwan_policy_object_security_fqdn_list"]
}

resource "sdwan_policy_object_security_fqdn_list" "n051" {
  description        = local.m_051["description"]
  entries            = local.m_051["entries"]
  feature_profile_id = local.m_051["feature_profile_id"]
  name               = local.m_051["name"]
}
