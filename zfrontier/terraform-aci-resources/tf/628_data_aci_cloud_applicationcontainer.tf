# 628 · data source aci_cloud_applicationcontainer · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud Application container
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_applicationcontainer.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_628 = yamldecode(file("${path.module}/../models/data_aci_cloud_applicationcontainer.yml"))["data_aci_cloud_applicationcontainer"]
}

data "aci_cloud_applicationcontainer" "n628" {
  annotation  = local.m_628["annotation"]
  description = local.m_628["description"]
  name        = local.m_628["name"]
  name_alias  = local.m_628["name_alias"]
  tenant_dn   = local.m_628["tenant_dn"]
}

output "n628_data_aci_cloud_applicationcontainer_id" {
  value = data.aci_cloud_applicationcontainer.n628.id
}
