# 039 · resource catalystcenter_credentials_https_write · 3. Network settings and tags
# This resource can manage a Credentials HTTPS Write.
# Reads models/catalystcenter_credentials_https_write.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_039 = yamldecode(file("${path.module}/../models/catalystcenter_credentials_https_write.yml"))["catalystcenter_credentials_https_write"]
}

resource "catalystcenter_credentials_https_write" "n039" {
  description = local.m_039["description"]
  password = local.m_039["password"]
  password_wo = try(var.secrets["catalystcenter_credentials_https_write.password_wo"], local.m_039["password_wo"])
  password_wo_version = local.m_039["password_wo_version"]
  port = local.m_039["port"]
  username = local.m_039["username"]
}
