# 284 · resource fmc_health_policy · 3. Policies
# This resource manages a Health Policy. Due to bug in certain FMC versions, updates are not supported; to change a policy, delete and recreate it. Any not configured health module will be created with its default settings. Only one ManagementCenterPolicy Health Policy can exist. Due to unability to
# Reads models/fmc_health_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_284 = yamldecode(file("${path.module}/../models/fmc_health_policy.yml"))["fmc_health_policy"]
}

resource "fmc_health_policy" "n284" {
  description                     = local.m_284["description"]
  domain                          = local.m_284["domain"]
  health_module_run_time_interval = local.m_284["health_module_run_time_interval"]
  health_modules                  = local.m_284["health_modules"]
  is_default_policy               = local.m_284["is_default_policy"]
  metric_collection_interval      = local.m_284["metric_collection_interval"]
  name                            = local.m_284["name"]
  policy_type                     = local.m_284["policy_type"]
}
