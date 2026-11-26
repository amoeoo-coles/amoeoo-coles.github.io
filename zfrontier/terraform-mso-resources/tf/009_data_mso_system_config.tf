# 009 · data source mso_system_config · 1. Platform, identity and sites
# Data source for MSO System Configuration.
# Class: not collected · DN: not collected
# Reads models/data_mso_system_config.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_009 = yamldecode(file("${path.module}/../models/data_mso_system_config.yml"))["data_mso_system_config"]
}

data "mso_system_config" "n009" {
}

output "n009_data_mso_system_config_id" {
  value = data.mso_system_config.n009.id
}
