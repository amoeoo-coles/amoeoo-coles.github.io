# 061 · resource ise_network_access_time_and_date_condition · 5. Network access
# This resource can manage a Network Access Time And Date Condition.
# Reads models/ise_network_access_time_and_date_condition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_061 = yamldecode(file("${path.module}/../models/ise_network_access_time_and_date_condition.yml"))["ise_network_access_time_and_date_condition"]
}

resource "ise_network_access_time_and_date_condition" "n061" {
  description = local.m_061["description"]
  end_date = local.m_061["end_date"]
  end_time = local.m_061["end_time"]
  exception_end_date = local.m_061["exception_end_date"]
  exception_end_time = local.m_061["exception_end_time"]
  exception_start_date = local.m_061["exception_start_date"]
  exception_start_time = local.m_061["exception_start_time"]
  is_negate = local.m_061["is_negate"]
  name = local.m_061["name"]
  start_date = local.m_061["start_date"]
  start_time = local.m_061["start_time"]
  week_days = local.m_061["week_days"]
  week_days_exception = local.m_061["week_days_exception"]
}
