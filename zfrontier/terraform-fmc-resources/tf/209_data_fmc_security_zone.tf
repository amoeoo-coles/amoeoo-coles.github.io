# 209 · data source fmc_security_zone · 2. Objects
# This data source reads the Security Zone.
# Reads models/data_fmc_security_zone.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_209 = yamldecode(file("${path.module}/../models/data_fmc_security_zone.yml"))["data_fmc_security_zone"]
}

data "fmc_security_zone" "n209" {
  domain = local.m_209["domain"]
  id     = local.m_209["id"]
  name   = local.m_209["name"]
}

output "n209_data_fmc_security_zone_id" {
  value = data.fmc_security_zone.n209.id
}
