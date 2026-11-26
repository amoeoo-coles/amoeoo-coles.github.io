# 107 · resource sdwan_dns_security_feature_profile · 4. Feature profiles
# This resource can manage a DNS Security Feature Profile . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_dns_security_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_107 = yamldecode(file("${path.module}/../models/sdwan_dns_security_feature_profile.yml"))["sdwan_dns_security_feature_profile"]
}

resource "sdwan_dns_security_feature_profile" "n107" {
  description = local.m_107["description"]
  name        = local.m_107["name"]
}
