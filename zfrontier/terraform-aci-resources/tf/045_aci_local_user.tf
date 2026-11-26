# 045 · resource aci_local_user · 1. System and fabric setup
# Manages ACI Local User
# APIC class: not collected · DN: not collected
# Reads models/aci_local_user.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_045 = yamldecode(file("${path.module}/../models/aci_local_user.yml"))["aci_local_user"]
}

resource "aci_local_user" "n045" {
  account_status      = local.m_045["account_status"]
  annotation          = local.m_045["annotation"]
  cert_attribute      = local.m_045["cert_attribute"]
  clear_pwd_history   = local.m_045["clear_pwd_history"]
  description         = local.m_045["description"]
  email               = local.m_045["email"]
  expiration          = local.m_045["expiration"]
  expires             = local.m_045["expires"]
  first_name          = local.m_045["first_name"]
  last_name           = local.m_045["last_name"]
  name                = local.m_045["name"]
  name_alias          = local.m_045["name_alias"]
  otpenable           = local.m_045["otpenable"]
  otpkey              = local.m_045["otpkey"]
  phone               = local.m_045["phone"]
  pwd                 = local.m_045["pwd"]
  pwd_life_time       = local.m_045["pwd_life_time"]
  pwd_update_required = local.m_045["pwd_update_required"]
  rbac_string         = local.m_045["rbac_string"]
  unix_user_id        = local.m_045["unix_user_id"]
}
