# 245 · data source fmc_url · 2. Objects
# This data source reads the URL.
# Reads models/data_fmc_url.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_245 = yamldecode(file("${path.module}/../models/data_fmc_url.yml"))["data_fmc_url"]
}

data "fmc_url" "n245" {
  domain = local.m_245["domain"]
  id = local.m_245["id"]
  name = local.m_245["name"]
}

output "n245_data_fmc_url_id" {
  value = data.fmc_url.n245.id
}
