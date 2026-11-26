# 031 · data source fmc_certificate_map · 2. Objects
# This data source reads the Certificate Map.
# Reads models/data_fmc_certificate_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_031 = yamldecode(file("${path.module}/../models/data_fmc_certificate_map.yml"))["data_fmc_certificate_map"]
}

data "fmc_certificate_map" "n031" {
  domain = local.m_031["domain"]
  id     = local.m_031["id"]
  name   = local.m_031["name"]
}

output "n031_data_fmc_certificate_map_id" {
  value = data.fmc_certificate_map.n031.id
}
