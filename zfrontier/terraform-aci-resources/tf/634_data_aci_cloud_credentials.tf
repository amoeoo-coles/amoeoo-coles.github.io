# 634 · data source aci_cloud_credentials · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud Credential to manage the cloud resources
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_credentials.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_634 = yamldecode(file("${path.module}/../models/data_aci_cloud_credentials.yml"))["data_aci_cloud_credentials"]
}

data "aci_cloud_credentials" "n634" {
  annotation      = local.m_634["annotation"]
  client_id       = local.m_634["client_id"]
  description     = local.m_634["description"]
  email           = local.m_634["email"]
  http_proxy      = local.m_634["http_proxy"]
  key             = local.m_634["key"]
  key_id          = local.m_634["key_id"]
  name            = local.m_634["name"]
  name_alias      = local.m_634["name_alias"]
  rsa_private_key = local.m_634["rsa_private_key"]
  tenant_dn       = local.m_634["tenant_dn"]
}

output "n634_data_aci_cloud_credentials_id" {
  value = data.aci_cloud_credentials.n634.id
}
