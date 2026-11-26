# 182 · resource mso_schema_template_deploy_ndo · 12. Validate, deploy and utility
# Manages deploy and redeploy operations for schema template.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_deploy_ndo.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_182 = yamldecode(file("${path.module}/../models/mso_schema_template_deploy_ndo.yml"))["mso_schema_template_deploy_ndo"]
}

resource "mso_schema_template_deploy_ndo" "n182" {
  force_apply         = local.m_182["force_apply"]
  re_deploy           = local.m_182["re_deploy"]
  schema_id           = local.m_182["schema_id"]
  site_ids            = local.m_182["site_ids"]
  template_id         = local.m_182["template_id"]
  template_name       = local.m_182["template_name"]
  template_type       = local.m_182["template_type"]
  undeploy            = local.m_182["undeploy"]
  undeploy_on_destroy = local.m_182["undeploy_on_destroy"]
}
