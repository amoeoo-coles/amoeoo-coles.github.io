# 015 · data source mso_schema · 3. Schema and templates
# Data source for MSO Schema.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_015 = yamldecode(file("${path.module}/../models/data_mso_schema.yml"))["data_mso_schema"]
}

data "mso_schema" "n015" {
  name = local.m_015["name"]
}

output "n015_data_mso_schema_id" {
  value = data.mso_schema.n015.id
}
