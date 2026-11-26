# 654 · data source aci_tenant_to_cloud_account · 6. Multi-Pod, Multi-Site and Cloud
# Data source for ACI Tenant to Cloud Account association
# APIC class: not collected · DN: not collected
# Reads models/data_aci_tenant_to_cloud_account.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_654 = yamldecode(file("${path.module}/../models/data_aci_tenant_to_cloud_account.yml"))["data_aci_tenant_to_cloud_account"]
}

data "aci_tenant_to_cloud_account" "n654" {
  annotation       = local.m_654["annotation"]
  cloud_account_dn = local.m_654["cloud_account_dn"]
  description      = local.m_654["description"]
  name_alias       = local.m_654["name_alias"]
  tenant_dn        = local.m_654["tenant_dn"]
}

output "n654_data_aci_tenant_to_cloud_account_id" {
  value = data.aci_tenant_to_cloud_account.n654.id
}
