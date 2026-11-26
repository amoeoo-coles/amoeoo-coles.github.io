# 653 · resource aci_tenant_to_cloud_account · 6. Multi-Pod, Multi-Site and Cloud
# Manages ACI Tenant to Cloud Account association
# APIC class: not collected · DN: not collected
# Reads models/aci_tenant_to_cloud_account.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_653 = yamldecode(file("${path.module}/../models/aci_tenant_to_cloud_account.yml"))["aci_tenant_to_cloud_account"]
}

resource "aci_tenant_to_cloud_account" "n653" {
  annotation       = local.m_653["annotation"]
  cloud_account_dn = local.m_653["cloud_account_dn"]
  description      = local.m_653["description"]
  name_alias       = local.m_653["name_alias"]
  tenant_dn        = local.m_653["tenant_dn"]
}
