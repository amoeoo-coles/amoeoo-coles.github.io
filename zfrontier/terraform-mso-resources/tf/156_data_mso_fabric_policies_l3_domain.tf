# 156 · data source mso_fabric_policies_l3_domain · 11. Fabric policy and resource templates
# Data source for L3 Domain.
# Class: not collected · DN: not collected
# Reads models/data_mso_fabric_policies_l3_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_156 = yamldecode(file("${path.module}/../models/data_mso_fabric_policies_l3_domain.yml"))["data_mso_fabric_policies_l3_domain"]
}

data "mso_fabric_policies_l3_domain" "n156" {
  name        = local.m_156["name"]
  template_id = local.m_156["template_id"]
}

output "n156_data_mso_fabric_policies_l3_domain_id" {
  value = data.mso_fabric_policies_l3_domain.n156.id
}
