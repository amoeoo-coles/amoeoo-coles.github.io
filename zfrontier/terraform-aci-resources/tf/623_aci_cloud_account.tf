# 623 · resource aci_cloud_account · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud Account
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_account.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_623 = yamldecode(file("${path.module}/../models/aci_cloud_account.yml"))["aci_cloud_account"]
}

resource "aci_cloud_account" "n623" {
  access_type                                = local.m_623["access_type"]
  account_id                                 = local.m_623["account_id"]
  annotation                                 = local.m_623["annotation"]
  cloud_credentials_dn                       = local.m_623["cloud_credentials_dn"]
  description                                = local.m_623["description"]
  name                                       = local.m_623["name"]
  name_alias                                 = local.m_623["name_alias"]
  relation_cloud_rs_account_to_access_policy = local.m_623["relation_cloud_rs_account_to_access_policy"]
  tenant_dn                                  = local.m_623["tenant_dn"]
  vendor                                     = local.m_623["vendor"]
}
