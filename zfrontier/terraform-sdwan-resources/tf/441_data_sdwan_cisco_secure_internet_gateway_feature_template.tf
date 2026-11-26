# 441 · data source sdwan_cisco_secure_internet_gateway_feature_template · 11. (Classic) feature templates
# This data source can read the Cisco Secure Internet Gateway feature template.
# Reads models/data_sdwan_cisco_secure_internet_gateway_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_441 = yamldecode(file("${path.module}/../models/data_sdwan_cisco_secure_internet_gateway_feature_template.yml"))["data_sdwan_cisco_secure_internet_gateway_feature_template"]
}

data "sdwan_cisco_secure_internet_gateway_feature_template" "n441" {
  id = local.m_441["id"]
  name = local.m_441["name"]
}

output "n441_data_sdwan_cisco_secure_internet_gateway_feature_template_id" {
  value = data.sdwan_cisco_secure_internet_gateway_feature_template.n441.id
}
