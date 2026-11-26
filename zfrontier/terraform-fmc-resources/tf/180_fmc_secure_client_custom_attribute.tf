# 180 · resource fmc_secure_client_custom_attribute · 2. Objects
# This resource manages a Secure Client Custom Attribute. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 7.4
# Reads models/fmc_secure_client_custom_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_180 = yamldecode(file("${path.module}/../models/fmc_secure_client_custom_attribute.yml"))["fmc_secure_client_custom_attribute"]
}

resource "fmc_secure_client_custom_attribute" "n180" {
  attribute_type = local.m_180["attribute_type"]
  defer_update_default_action = local.m_180["defer_update_default_action"]
  defer_update_minimum_secure_client_version = local.m_180["defer_update_minimum_secure_client_version"]
  defer_update_prompt_dismiss_timeout = local.m_180["defer_update_prompt_dismiss_timeout"]
  defer_update_prompt_type = local.m_180["defer_update_prompt_type"]
  description = local.m_180["description"]
  domain = local.m_180["domain"]
  dynamic_split_tunnel_excluded_domains = local.m_180["dynamic_split_tunnel_excluded_domains"]
  dynamic_split_tunnel_included_domains = local.m_180["dynamic_split_tunnel_included_domains"]
  name = local.m_180["name"]
  per_app_vpn_value = local.m_180["per_app_vpn_value"]
  user_defined_attribute_name = local.m_180["user_defined_attribute_name"]
  user_defined_attribute_value = local.m_180["user_defined_attribute_value"]
}
