# 017 · data source mso_schema_site · 3. Schema and templates
# Data source for MSO Schema Site.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_017 = yamldecode(file("${path.module}/../models/data_mso_schema_site.yml"))["data_mso_schema_site"]
}

data "mso_schema_site" "n017" {
  name          = local.m_017["name"]
  schema_id     = local.m_017["schema_id"]
  template_name = local.m_017["template_name"]
}

output "n017_data_mso_schema_site_id" {
  value = data.mso_schema_site.n017.id
}
