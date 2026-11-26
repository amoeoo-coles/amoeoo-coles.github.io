# 360 · resource sdwan_data_fqdn_prefix_list_policy_object · 10. (Classic) policy objects
# This resource can manage a Data FQDN Prefix List Policy Object .
# Reads models/sdwan_data_fqdn_prefix_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_360 = yamldecode(file("${path.module}/../models/sdwan_data_fqdn_prefix_list_policy_object.yml"))["sdwan_data_fqdn_prefix_list_policy_object"]
}

resource "sdwan_data_fqdn_prefix_list_policy_object" "n360" {
  entries = local.m_360["entries"]
  name    = local.m_360["name"]
}
