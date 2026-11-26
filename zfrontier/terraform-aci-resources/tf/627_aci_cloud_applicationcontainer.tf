# 627 · resource aci_cloud_applicationcontainer · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud Application container
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_applicationcontainer.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_627 = yamldecode(file("${path.module}/../models/aci_cloud_applicationcontainer.yml"))["aci_cloud_applicationcontainer"]
}

resource "aci_cloud_applicationcontainer" "n627" {
  annotation  = local.m_627["annotation"]
  description = local.m_627["description"]
  name        = local.m_627["name"]
  name_alias  = local.m_627["name_alias"]
  tenant_dn   = local.m_627["tenant_dn"]
}
