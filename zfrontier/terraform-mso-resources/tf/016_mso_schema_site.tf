# 016 · resource mso_schema_site · 3. Schema and templates
# Manages MSO Schema Site
# Class: not collected · DN: not collected
# Reads models/mso_schema_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_016 = yamldecode(file("${path.module}/../models/mso_schema_site.yml"))["mso_schema_site"]
}

resource "mso_schema_site" "n016" {
  schema_id           = local.m_016["schema_id"]
  site_id             = local.m_016["site_id"]
  template_name       = local.m_016["template_name"]
  undeploy_on_destroy = local.m_016["undeploy_on_destroy"]
}
