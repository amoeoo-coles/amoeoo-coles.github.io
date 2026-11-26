# 037 · resource catalystcenter_credentials_https_read · 3. Network settings and tags
# This resource can manage a Credentials HTTPS Read.
# Reads models/catalystcenter_credentials_https_read.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_037 = yamldecode(file("${path.module}/../models/catalystcenter_credentials_https_read.yml"))["catalystcenter_credentials_https_read"]
}

resource "catalystcenter_credentials_https_read" "n037" {
  description         = local.m_037["description"]
  password            = local.m_037["password"]
  password_wo         = try(var.secrets["catalystcenter_credentials_https_read.password_wo"], local.m_037["password_wo"])
  password_wo_version = local.m_037["password_wo_version"]
  port                = local.m_037["port"]
  username            = local.m_037["username"]
}
