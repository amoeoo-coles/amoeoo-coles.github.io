# 102 · data source sdwan_custom_application · 3. Policy objects and custom applications
# This data source can read the Custom Application .
# Reads models/data_sdwan_custom_application.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_102 = yamldecode(file("${path.module}/../models/data_sdwan_custom_application.yml"))["data_sdwan_custom_application"]
}

data "sdwan_custom_application" "n102" {
  id = local.m_102["id"]
}

output "n102_data_sdwan_custom_application_id" {
  value = data.sdwan_custom_application.n102.id
}
