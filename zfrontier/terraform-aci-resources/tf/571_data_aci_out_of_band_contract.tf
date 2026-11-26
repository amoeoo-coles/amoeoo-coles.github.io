# 571 · data source aci_out_of_band_contract · 4. Application
# Data source for ACI Out Of Band Contract
# APIC class: vzOOBBrCP · DN: uni/tn-mgmt/oobbrc-{name}
# Reads models/data_aci_out_of_band_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_571 = yamldecode(file("${path.module}/../models/data_aci_out_of_band_contract.yml"))["data_aci_out_of_band_contract"]
}

data "aci_out_of_band_contract" "n571" {
  name = local.m_571["name"]
}

output "n571_data_aci_out_of_band_contract_id" {
  value = data.aci_out_of_band_contract.n571.id
}
