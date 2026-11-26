# 306 · data source fmc_snmp_alerts · 3. Policies
# This data source reads the SNMP Alerts.
# Reads models/data_fmc_snmp_alerts.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_306 = yamldecode(file("${path.module}/../models/data_fmc_snmp_alerts.yml"))["data_fmc_snmp_alerts"]
}

data "fmc_snmp_alerts" "n306" {
  domain = local.m_306["domain"]
  items  = local.m_306["items"]
}

output "n306_data_fmc_snmp_alerts_id" {
  value = data.fmc_snmp_alerts.n306.id
}
