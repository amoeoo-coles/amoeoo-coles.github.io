# 046 · data source aci_local_user · 1. System and fabric setup
# Data source for ACI Local User
# APIC class: not collected · DN: not collected
# Reads models/data_aci_local_user.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_046 = yamldecode(file("${path.module}/../models/data_aci_local_user.yml"))["data_aci_local_user"]
}

data "aci_local_user" "n046" {
  account_status      = local.m_046["account_status"]
  annotation          = local.m_046["annotation"]
  cert_attribute      = local.m_046["cert_attribute"]
  clear_pwd_history   = local.m_046["clear_pwd_history"]
  description         = local.m_046["description"]
  email               = local.m_046["email"]
  expiration          = local.m_046["expiration"]
  expires             = local.m_046["expires"]
  first_name          = local.m_046["first_name"]
  last_name           = local.m_046["last_name"]
  name                = local.m_046["name"]
  name_alias          = local.m_046["name_alias"]
  otpenable           = local.m_046["otpenable"]
  otpkey              = local.m_046["otpkey"]
  phone               = local.m_046["phone"]
  pwd_life_time       = local.m_046["pwd_life_time"]
  pwd_update_required = local.m_046["pwd_update_required"]
  rbac_string         = local.m_046["rbac_string"]
  unix_user_id        = local.m_046["unix_user_id"]
}

output "n046_data_aci_local_user_id" {
  value = data.aci_local_user.n046.id
}
