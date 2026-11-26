# 016 · data source fmc_application_tags · 2. Objects
# This data source reads the Application Tags.
# Reads models/data_fmc_application_tags.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_016 = yamldecode(file("${path.module}/../models/data_fmc_application_tags.yml"))["data_fmc_application_tags"]
}

data "fmc_application_tags" "n016" {
  domain = local.m_016["domain"]
  items = local.m_016["items"]
}

output "n016_data_fmc_application_tags_id" {
  value = data.fmc_application_tags.n016.id
}
