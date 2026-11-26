# 234 · resource fmc_time_range · 2. Objects
# This resource manages a Time Range.
# Reads models/fmc_time_range.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_234 = yamldecode(file("${path.module}/../models/fmc_time_range.yml"))["fmc_time_range"]
}

resource "fmc_time_range" "n234" {
  description = local.m_234["description"]
  domain = local.m_234["domain"]
  end_time = local.m_234["end_time"]
  name = local.m_234["name"]
  recurrence_list = local.m_234["recurrence_list"]
  start_time = local.m_234["start_time"]
}
