# 159 · data source fmc_port · 2. Objects
# This data source reads the Port.
# Reads models/data_fmc_port.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_159 = yamldecode(file("${path.module}/../models/data_fmc_port.yml"))["data_fmc_port"]
}

data "fmc_port" "n159" {
  domain = local.m_159["domain"]
  id     = local.m_159["id"]
  name   = local.m_159["name"]
}

output "n159_data_fmc_port_id" {
  value = data.fmc_port.n159.id
}
