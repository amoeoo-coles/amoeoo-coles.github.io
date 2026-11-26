# 165 · data source fmc_ports · 2. Objects
# This data source reads the Ports.
# Reads models/data_fmc_ports.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_165 = yamldecode(file("${path.module}/../models/data_fmc_ports.yml"))["data_fmc_ports"]
}

data "fmc_ports" "n165" {
  domain = local.m_165["domain"]
  items = local.m_165["items"]
}

output "n165_data_fmc_ports_id" {
  value = data.fmc_ports.n165.id
}
