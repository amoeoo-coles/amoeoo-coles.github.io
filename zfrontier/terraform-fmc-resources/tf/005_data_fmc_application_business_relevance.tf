# 005 · data source fmc_application_business_relevance · 2. Objects
# This data source reads the Application Business Relevance level.
# Reads models/data_fmc_application_business_relevance.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_005 = yamldecode(file("${path.module}/../models/data_fmc_application_business_relevance.yml"))["data_fmc_application_business_relevance"]
}

data "fmc_application_business_relevance" "n005" {
  domain = local.m_005["domain"]
  id     = local.m_005["id"]
  name   = local.m_005["name"]
}

output "n005_data_fmc_application_business_relevance_id" {
  value = data.fmc_application_business_relevance.n005.id
}
