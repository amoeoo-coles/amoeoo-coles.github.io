# 492 · data source sdwan_cli_device_template · 12. (Classic) device templates
# This data source can read the CLI Device Template .
# Reads models/data_sdwan_cli_device_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_492 = yamldecode(file("${path.module}/../models/data_sdwan_cli_device_template.yml"))["data_sdwan_cli_device_template"]
}

data "sdwan_cli_device_template" "n492" {
  id = local.m_492["id"]
}

output "n492_data_sdwan_cli_device_template_id" {
  value = data.sdwan_cli_device_template.n492.id
}
