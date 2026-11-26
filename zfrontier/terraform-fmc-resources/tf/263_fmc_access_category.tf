# 263 · resource fmc_access_category · 3. Policies
# This resource manages an Access Category.
# Reads models/fmc_access_category.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_263 = yamldecode(file("${path.module}/../models/fmc_access_category.yml"))["fmc_access_category"]
}

resource "fmc_access_category" "n263" {
  access_control_policy_id = local.m_263["access_control_policy_id"]
  domain = local.m_263["domain"]
  insert_after_rule = local.m_263["insert_after_rule"]
  insert_before_category = local.m_263["insert_before_category"]
  insert_before_rule = local.m_263["insert_before_rule"]
  name = local.m_263["name"]
  section = local.m_263["section"]
}
