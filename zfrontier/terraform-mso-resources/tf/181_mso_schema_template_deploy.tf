# 181 · resource mso_schema_template_deploy · 12. Validate, deploy and utility
# Manages deploy/undeploy operations for schema template on sites.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_deploy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_181 = yamldecode(file("${path.module}/../models/mso_schema_template_deploy.yml"))["mso_schema_template_deploy"]
}

resource "mso_schema_template_deploy" "n181" {
  force_apply   = local.m_181["force_apply"]
  schema_id     = local.m_181["schema_id"]
  site_id       = local.m_181["site_id"]
  template_name = local.m_181["template_name"]
  undeploy      = local.m_181["undeploy"]
}
