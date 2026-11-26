# 046 · resource mso_schema_site_anp · 6. ANP and EPG
# MSO Schema Site Application Network Profile(ANP) Resource
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_anp.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_046 = yamldecode(file("${path.module}/../models/mso_schema_site_anp.yml"))["mso_schema_site_anp"]
}

resource "mso_schema_site_anp" "n046" {
  anp_name      = local.m_046["anp_name"]
  schema_id     = local.m_046["schema_id"]
  site_id       = local.m_046["site_id"]
  template_name = local.m_046["template_name"]
}
