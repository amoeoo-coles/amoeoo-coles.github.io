# 288 · data source aci_tenant · 3. Tenant and networking
# Data source for ACI Tenant
# APIC class: fvTenant · DN: uni/tn-{name}
# Reads models/data_aci_tenant.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_288 = yamldecode(file("${path.module}/../models/data_aci_tenant.yml"))["data_aci_tenant"]
}

data "aci_tenant" "n288" {
  name = local.m_288["name"]
}

output "n288_data_aci_tenant_id" {
  value = data.aci_tenant.n288.id
}
