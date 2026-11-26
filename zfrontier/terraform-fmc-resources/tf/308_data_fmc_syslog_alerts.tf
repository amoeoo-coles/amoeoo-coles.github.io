# 308 · data source fmc_syslog_alerts · 3. Policies
# This data source reads the Syslog Alerts.
# Reads models/data_fmc_syslog_alerts.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_308 = yamldecode(file("${path.module}/../models/data_fmc_syslog_alerts.yml"))["data_fmc_syslog_alerts"]
}

data "fmc_syslog_alerts" "n308" {
  domain = local.m_308["domain"]
  items  = local.m_308["items"]
}

output "n308_data_fmc_syslog_alerts_id" {
  value = data.fmc_syslog_alerts.n308.id
}
