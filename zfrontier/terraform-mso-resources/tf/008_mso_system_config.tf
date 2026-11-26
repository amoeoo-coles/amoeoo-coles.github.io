# 008 · resource mso_system_config · 1. Platform, identity and sites
# Manages MSO System Configuration.
# Class: not collected · DN: not collected
# Reads models/mso_system_config.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_008 = yamldecode(file("${path.module}/../models/mso_system_config.yml"))["mso_system_config"]
}

resource "mso_system_config" "n008" {
  alias          = local.m_008["alias"]
  change_control = local.m_008["change_control"]
  dynamic "banner" {
    for_each = local.m_008["banner"] == null ? [] : local.m_008["banner"]
    content {
      message = lookup(banner.value, "message", null)
      state   = lookup(banner.value, "state", null)
      type    = lookup(banner.value, "type", null)
    }
  }
}
