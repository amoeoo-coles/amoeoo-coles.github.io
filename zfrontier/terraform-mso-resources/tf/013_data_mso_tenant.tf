# 013 · data source mso_tenant · 2. Tenants
# Data source for MSO Tenant.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_013 = yamldecode(file("${path.module}/../models/data_mso_tenant.yml"))["data_mso_tenant"]
}

data "mso_tenant" "n013" {
  name = local.m_013["name"]
}

output "n013_data_mso_tenant_id" {
  value = data.mso_tenant.n013.id
}
