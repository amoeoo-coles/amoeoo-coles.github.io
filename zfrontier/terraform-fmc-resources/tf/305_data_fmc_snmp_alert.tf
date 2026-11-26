# 305 · data source fmc_snmp_alert · 3. Policies
# This data source reads the SNMP Alert.
# Reads models/data_fmc_snmp_alert.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_305 = yamldecode(file("${path.module}/../models/data_fmc_snmp_alert.yml"))["data_fmc_snmp_alert"]
}

data "fmc_snmp_alert" "n305" {
  domain = local.m_305["domain"]
  id     = local.m_305["id"]
  name   = local.m_305["name"]
}

output "n305_data_fmc_snmp_alert_id" {
  value = data.fmc_snmp_alert.n305.id
}
