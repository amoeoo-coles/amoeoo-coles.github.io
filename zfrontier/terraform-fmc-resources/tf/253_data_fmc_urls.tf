# 253 · data source fmc_urls · 2. Objects
# This data source reads the URLs.
# Reads models/data_fmc_urls.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_253 = yamldecode(file("${path.module}/../models/data_fmc_urls.yml"))["data_fmc_urls"]
}

data "fmc_urls" "n253" {
  domain = local.m_253["domain"]
  items  = local.m_253["items"]
}

output "n253_data_fmc_urls_id" {
  value = data.fmc_urls.n253.id
}
