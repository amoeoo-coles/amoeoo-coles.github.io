# 035 · resource catalystcenter_credentials_cli · 3. Network settings and tags
# This resource can manage a Credentials CLI.
# Reads models/catalystcenter_credentials_cli.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_035 = yamldecode(file("${path.module}/../models/catalystcenter_credentials_cli.yml"))["catalystcenter_credentials_cli"]
}

resource "catalystcenter_credentials_cli" "n035" {
  description                = local.m_035["description"]
  enable_password            = local.m_035["enable_password"]
  enable_password_wo         = local.m_035["enable_password_wo"]
  enable_password_wo_version = local.m_035["enable_password_wo_version"]
  password                   = local.m_035["password"]
  password_wo                = try(var.secrets["catalystcenter_credentials_cli.password_wo"], local.m_035["password_wo"])
  password_wo_version        = local.m_035["password_wo_version"]
  username                   = local.m_035["username"]
}
