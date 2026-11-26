# 117 · resource sdwan_sig_security_feature_profile · 4. Feature profiles
# This resource can manage a SIG Security Feature Profile . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_sig_security_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_117 = yamldecode(file("${path.module}/../models/sdwan_sig_security_feature_profile.yml"))["sdwan_sig_security_feature_profile"]
}

resource "sdwan_sig_security_feature_profile" "n117" {
  description = local.m_117["description"]
  name        = local.m_117["name"]
}
