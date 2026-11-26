# 629 · resource aci_cloud_aws_provider · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud AWS Provider
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_aws_provider.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_629 = yamldecode(file("${path.module}/../models/aci_cloud_aws_provider.yml"))["aci_cloud_aws_provider"]
}

resource "aci_cloud_aws_provider" "n629" {
  access_key_id     = local.m_629["access_key_id"]
  account_id        = local.m_629["account_id"]
  annotation        = local.m_629["annotation"]
  description       = local.m_629["description"]
  email             = local.m_629["email"]
  http_proxy        = local.m_629["http_proxy"]
  is_account_in_org = local.m_629["is_account_in_org"]
  is_trusted        = local.m_629["is_trusted"]
  name_alias        = local.m_629["name_alias"]
  provider_id       = local.m_629["provider_id"]
  region            = local.m_629["region"]
  secret_access_key = local.m_629["secret_access_key"]
  tenant_dn         = local.m_629["tenant_dn"]
}
