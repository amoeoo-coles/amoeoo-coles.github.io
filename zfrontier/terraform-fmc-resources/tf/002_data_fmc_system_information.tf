# 002 · data source fmc_system_information · 1. System information and licences
# Get FMC system information.
# Reads models/data_fmc_system_information.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_002 = yamldecode(file("${path.module}/../models/data_fmc_system_information.yml"))["data_fmc_system_information"]
}

data "fmc_system_information" "n002" {
}
