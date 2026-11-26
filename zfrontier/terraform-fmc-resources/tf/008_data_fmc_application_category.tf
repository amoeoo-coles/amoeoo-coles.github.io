# 008 · data source fmc_application_category · 2. Objects
# This data source reads the Application Category.
# Reads models/data_fmc_application_category.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_008 = yamldecode(file("${path.module}/../models/data_fmc_application_category.yml"))["data_fmc_application_category"]
}

data "fmc_application_category" "n008" {
  domain = local.m_008["domain"]
  id     = local.m_008["id"]
  name   = local.m_008["name"]
}

output "n008_data_fmc_application_category_id" {
  value = data.fmc_application_category.n008.id
}
