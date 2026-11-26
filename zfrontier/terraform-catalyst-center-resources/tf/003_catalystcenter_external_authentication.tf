# 003 · resource catalystcenter_external_authentication · 1. System
# Enable or disable external authentication for Catalyst Center user login. AAA or ISE servers must be configured before external authentication can be enabled.
# Reads models/catalystcenter_external_authentication.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_003 = yamldecode(file("${path.module}/../models/catalystcenter_external_authentication.yml"))["catalystcenter_external_authentication"]
}

resource "catalystcenter_external_authentication" "n003" {
  enabled = local.m_003["enabled"]
  name    = local.m_003["name"]
}
