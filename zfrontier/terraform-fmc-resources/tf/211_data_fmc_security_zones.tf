# 211 · data source fmc_security_zones · 2. Objects
# This data source reads the Security Zones.
# Reads models/data_fmc_security_zones.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_211 = yamldecode(file("${path.module}/../models/data_fmc_security_zones.yml"))["data_fmc_security_zones"]
}

data "fmc_security_zones" "n211" {
  domain = local.m_211["domain"]
  items  = local.m_211["items"]
}

output "n211_data_fmc_security_zones_id" {
  value = data.fmc_security_zones.n211.id
}
