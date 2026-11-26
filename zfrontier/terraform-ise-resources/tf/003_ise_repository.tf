# 003 · resource ise_repository · 1. System
# This resource can manage a Repository.
# Reads models/ise_repository.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_003 = yamldecode(file("${path.module}/../models/ise_repository.yml"))["ise_repository"]
}

resource "ise_repository" "n003" {
  enable_pki = local.m_003["enable_pki"]
  name = local.m_003["name"]
  password = local.m_003["password"]
  password_wo = try(var.secrets["ise_repository.password_wo"], local.m_003["password_wo"])
  password_wo_version = local.m_003["password_wo_version"]
  path = local.m_003["path"]
  protocol = local.m_003["protocol"]
  server_name = local.m_003["server_name"]
  user_name = local.m_003["user_name"]
}
