# 015 · data source fmc_application_tag · 2. Objects
# This data source reads the Application Tag.
# Reads models/data_fmc_application_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_015 = yamldecode(file("${path.module}/../models/data_fmc_application_tag.yml"))["data_fmc_application_tag"]
}

data "fmc_application_tag" "n015" {
  domain = local.m_015["domain"]
  id = local.m_015["id"]
  name = local.m_015["name"]
}

output "n015_data_fmc_application_tag_id" {
  value = data.fmc_application_tag.n015.id
}
