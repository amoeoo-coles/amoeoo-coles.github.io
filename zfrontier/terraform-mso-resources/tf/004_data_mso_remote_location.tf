# 004 · data source mso_remote_location · 1. Platform, identity and sites
# Data source for MSO Remote Location.
# Class: not collected · DN: not collected
# Reads models/data_mso_remote_location.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_004 = yamldecode(file("${path.module}/../models/data_mso_remote_location.yml"))["data_mso_remote_location"]
}

data "mso_remote_location" "n004" {
  name = local.m_004["name"]
}

output "n004_data_mso_remote_location_id" {
  value = data.mso_remote_location.n004.id
}
