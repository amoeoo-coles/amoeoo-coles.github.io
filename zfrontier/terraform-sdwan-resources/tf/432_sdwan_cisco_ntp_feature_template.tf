# 432 · resource sdwan_cisco_ntp_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco NTP feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_ntp_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_432 = yamldecode(file("${path.module}/../models/sdwan_cisco_ntp_feature_template.yml"))["sdwan_cisco_ntp_feature_template"]
}

resource "sdwan_cisco_ntp_feature_template" "n432" {
  authentication_keys = local.m_432["authentication_keys"]
  description = local.m_432["description"]
  device_types = local.m_432["device_types"]
  master = local.m_432["master"]
  master_source_interface = local.m_432["master_source_interface"]
  master_source_interface_variable = local.m_432["master_source_interface_variable"]
  master_stratum = local.m_432["master_stratum"]
  master_stratum_variable = local.m_432["master_stratum_variable"]
  master_variable = local.m_432["master_variable"]
  name = local.m_432["name"]
  servers = local.m_432["servers"]
  trusted_keys = local.m_432["trusted_keys"]
  trusted_keys_variable = local.m_432["trusted_keys_variable"]
}
