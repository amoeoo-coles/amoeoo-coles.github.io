# 305 · resource sdwan_cli_config_feature · 8. Features: CLI, topology, SIG, SSE and other
# This resource can manage a CLI Config Feature . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_cli_config_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_305 = yamldecode(file("${path.module}/../models/sdwan_cli_config_feature.yml"))["sdwan_cli_config_feature"]
}

resource "sdwan_cli_config_feature" "n305" {
  cli_configuration  = local.m_305["cli_configuration"]
  description        = local.m_305["description"]
  feature_profile_id = local.m_305["feature_profile_id"]
  name               = local.m_305["name"]
}
