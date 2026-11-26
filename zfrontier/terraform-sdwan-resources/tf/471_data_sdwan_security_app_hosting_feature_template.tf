# 471 · data source sdwan_security_app_hosting_feature_template · 11. (Classic) feature templates
# This data source can read the Security App Hosting feature template.
# Reads models/data_sdwan_security_app_hosting_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_471 = yamldecode(file("${path.module}/../models/data_sdwan_security_app_hosting_feature_template.yml"))["data_sdwan_security_app_hosting_feature_template"]
}

data "sdwan_security_app_hosting_feature_template" "n471" {
  id   = local.m_471["id"]
  name = local.m_471["name"]
}

output "n471_data_sdwan_security_app_hosting_feature_template_id" {
  value = data.sdwan_security_app_hosting_feature_template.n471.id
}
