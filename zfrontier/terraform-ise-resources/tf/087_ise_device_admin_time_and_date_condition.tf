# 087 · resource ise_device_admin_time_and_date_condition · 6. Device administration
# This resource can manage a Device Admin Time And Date Condition.
# Reads models/ise_device_admin_time_and_date_condition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_087 = yamldecode(file("${path.module}/../models/ise_device_admin_time_and_date_condition.yml"))["ise_device_admin_time_and_date_condition"]
}

resource "ise_device_admin_time_and_date_condition" "n087" {
  description = local.m_087["description"]
  end_date = local.m_087["end_date"]
  end_time = local.m_087["end_time"]
  exception_end_date = local.m_087["exception_end_date"]
  exception_end_time = local.m_087["exception_end_time"]
  exception_start_date = local.m_087["exception_start_date"]
  exception_start_time = local.m_087["exception_start_time"]
  is_negate = local.m_087["is_negate"]
  name = local.m_087["name"]
  start_date = local.m_087["start_date"]
  start_time = local.m_087["start_time"]
  week_days = local.m_087["week_days"]
  week_days_exception = local.m_087["week_days_exception"]
}
