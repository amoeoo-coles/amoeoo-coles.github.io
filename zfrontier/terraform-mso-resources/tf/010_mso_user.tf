# 010 · resource mso_user · 1. Platform, identity and sites
# Manages MSO User
# Class: not collected · DN: not collected
# Reads models/mso_user.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_010 = yamldecode(file("${path.module}/../models/mso_user.yml"))["mso_user"]
}

resource "mso_user" "n010" {
  account_status = local.m_010["account_status"]
  domain         = local.m_010["domain"]
  email          = local.m_010["email"]
  first_name     = local.m_010["first_name"]
  last_name      = local.m_010["last_name"]
  phone          = local.m_010["phone"]
  user_password  = local.m_010["user_password"]
  username       = local.m_010["username"]
  dynamic "roles" {
    for_each = local.m_010["roles"] == null ? [] : local.m_010["roles"]
    content {
      access_type = lookup(roles.value, "access_type", null)
      roleid      = lookup(roles.value, "roleid", null)
    }
  }
}
