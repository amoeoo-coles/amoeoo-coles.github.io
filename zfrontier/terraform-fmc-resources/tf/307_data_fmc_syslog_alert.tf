# 307 · data source fmc_syslog_alert · 3. Policies
# This data source reads the Syslog Alert.
# Reads models/data_fmc_syslog_alert.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_307 = yamldecode(file("${path.module}/../models/data_fmc_syslog_alert.yml"))["data_fmc_syslog_alert"]
}

data "fmc_syslog_alert" "n307" {
  domain = local.m_307["domain"]
  id     = local.m_307["id"]
  name   = local.m_307["name"]
}

output "n307_data_fmc_syslog_alert_id" {
  value = data.fmc_syslog_alert.n307.id
}
