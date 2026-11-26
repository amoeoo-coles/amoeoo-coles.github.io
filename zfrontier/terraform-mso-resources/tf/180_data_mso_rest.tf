# 180 · data source mso_rest · 12. Validate, deploy and utility
# Data source for reading MSO objects via REST API.
# Class: not collected · DN: not collected
# Reads models/data_mso_rest.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_180 = yamldecode(file("${path.module}/../models/data_mso_rest.yml"))["data_mso_rest"]
}

data "mso_rest" "n180" {
  path = local.m_180["path"]
}

output "n180_data_mso_rest_id" {
  value = data.mso_rest.n180.id
}
