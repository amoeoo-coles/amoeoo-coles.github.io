# 633 · resource aci_cloud_credentials · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud Credential to manage the cloud resources
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_credentials.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_633 = yamldecode(file("${path.module}/../models/aci_cloud_credentials.yml"))["aci_cloud_credentials"]
}

resource "aci_cloud_credentials" "n633" {
  annotation           = local.m_633["annotation"]
  client_id            = local.m_633["client_id"]
  description          = local.m_633["description"]
  email                = local.m_633["email"]
  http_proxy           = local.m_633["http_proxy"]
  key                  = local.m_633["key"]
  key_id               = local.m_633["key_id"]
  name                 = local.m_633["name"]
  name_alias           = local.m_633["name_alias"]
  relation_cloud_rs_ad = local.m_633["relation_cloud_rs_ad"]
  rsa_private_key      = local.m_633["rsa_private_key"]
  tenant_dn            = local.m_633["tenant_dn"]
}
