# 105 · resource sdwan_cli_feature_profile · 4. Feature profiles
# This resource can manage a CLI Feature Profile . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_cli_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_105 = yamldecode(file("${path.module}/../models/sdwan_cli_feature_profile.yml"))["sdwan_cli_feature_profile"]
}

resource "sdwan_cli_feature_profile" "n105" {
  description = local.m_105["description"]
  name = local.m_105["name"]
}
