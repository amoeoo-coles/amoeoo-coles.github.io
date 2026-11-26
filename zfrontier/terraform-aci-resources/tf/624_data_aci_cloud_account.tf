# 624 · data source aci_cloud_account · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud Account
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_account.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_624 = yamldecode(file("${path.module}/../models/data_aci_cloud_account.yml"))["data_aci_cloud_account"]
}

data "aci_cloud_account" "n624" {
  access_type = local.m_624["access_type"]
  account_id  = local.m_624["account_id"]
  annotation  = local.m_624["annotation"]
  description = local.m_624["description"]
  name        = local.m_624["name"]
  name_alias  = local.m_624["name_alias"]
  tenant_dn   = local.m_624["tenant_dn"]
  vendor      = local.m_624["vendor"]
}

output "n624_data_aci_cloud_account_id" {
  value = data.aci_cloud_account.n624.id
}
