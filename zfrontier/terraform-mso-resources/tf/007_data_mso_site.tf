# 007 · data source mso_site · 1. Platform, identity and sites
# Data source for MSO Site.
# Class: not collected · DN: not collected
# Reads models/data_mso_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_007 = yamldecode(file("${path.module}/../models/data_mso_site.yml"))["data_mso_site"]
}

data "mso_site" "n007" {
  name = local.m_007["name"]
}

output "n007_data_mso_site_id" {
  value = data.mso_site.n007.id
}
