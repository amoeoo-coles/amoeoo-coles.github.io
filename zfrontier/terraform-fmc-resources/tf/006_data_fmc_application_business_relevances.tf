# 006 · data source fmc_application_business_relevances · 2. Objects
# This data source reads the Application Business Relevance levels.
# Reads models/data_fmc_application_business_relevances.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_006 = yamldecode(file("${path.module}/../models/data_fmc_application_business_relevances.yml"))["data_fmc_application_business_relevances"]
}

data "fmc_application_business_relevances" "n006" {
  domain = local.m_006["domain"]
  items = local.m_006["items"]
}

output "n006_data_fmc_application_business_relevances_id" {
  value = data.fmc_application_business_relevances.n006.id
}
