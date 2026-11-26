# 010 · resource catalystcenter_user · 1. System
# This resource can manage an User.
# Reads models/catalystcenter_user.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_010 = yamldecode(file("${path.module}/../models/catalystcenter_user.yml"))["catalystcenter_user"]
}

resource "catalystcenter_user" "n010" {
  email               = local.m_010["email"]
  first_name          = local.m_010["first_name"]
  last_name           = local.m_010["last_name"]
  password            = local.m_010["password"]
  password_wo         = try(var.secrets["catalystcenter_user.password_wo"], local.m_010["password_wo"])
  password_wo_version = local.m_010["password_wo_version"]
  role_ids            = local.m_010["role_ids"]
  username            = local.m_010["username"]
}
