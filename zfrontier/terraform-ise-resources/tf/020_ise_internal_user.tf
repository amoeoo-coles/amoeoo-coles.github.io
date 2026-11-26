# 020 · resource ise_internal_user · 2. Identity management
# This resource can manage an Internal User.
# Reads models/ise_internal_user.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_020 = yamldecode(file("${path.module}/../models/ise_internal_user.yml"))["ise_internal_user"]
}

resource "ise_internal_user" "n020" {
  account_name_alias         = local.m_020["account_name_alias"]
  change_password            = local.m_020["change_password"]
  custom_attributes          = local.m_020["custom_attributes"]
  description                = local.m_020["description"]
  email                      = local.m_020["email"]
  enable_password            = local.m_020["enable_password"]
  enable_password_wo         = try(var.secrets["ise_internal_user.enable_password_wo"], local.m_020["enable_password_wo"])
  enable_password_wo_version = local.m_020["enable_password_wo_version"]
  enabled                    = local.m_020["enabled"]
  first_name                 = local.m_020["first_name"]
  identity_groups            = local.m_020["identity_groups"]
  last_name                  = local.m_020["last_name"]
  name                       = local.m_020["name"]
  password                   = local.m_020["password"]
  password_id_store          = try(var.secrets["ise_internal_user.password_id_store"], local.m_020["password_id_store"])
  password_never_expires     = local.m_020["password_never_expires"]
  password_wo                = try(var.secrets["ise_internal_user.password_wo"], local.m_020["password_wo"])
  password_wo_version        = local.m_020["password_wo_version"]
}
