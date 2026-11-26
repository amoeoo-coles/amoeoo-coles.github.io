# 006 · resource mso_site · 1. Platform, identity and sites
# Manages MSO Site
# Class: not collected · DN: not collected
# Reads models/mso_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_006 = yamldecode(file("${path.module}/../models/mso_site.yml"))["mso_site"]
}

resource "mso_site" "n006" {
  apic_site_id     = local.m_006["apic_site_id"]
  cloud_providers  = local.m_006["cloud_providers"]
  labels           = local.m_006["labels"]
  location         = local.m_006["location"]
  login_domain     = local.m_006["login_domain"]
  maintenance_mode = local.m_006["maintenance_mode"]
  name             = local.m_006["name"]
  password         = local.m_006["password"]
  platform         = local.m_006["platform"]
  urls             = local.m_006["urls"]
  username         = local.m_006["username"]
}
