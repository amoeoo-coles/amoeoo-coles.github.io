# 630 · data source aci_cloud_aws_provider · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud AWS Provider
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_aws_provider.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_630 = yamldecode(file("${path.module}/../models/data_aci_cloud_aws_provider.yml"))["data_aci_cloud_aws_provider"]
}

data "aci_cloud_aws_provider" "n630" {
  access_key_id     = local.m_630["access_key_id"]
  account_id        = local.m_630["account_id"]
  annotation        = local.m_630["annotation"]
  description       = local.m_630["description"]
  email             = local.m_630["email"]
  http_proxy        = local.m_630["http_proxy"]
  is_account_in_org = local.m_630["is_account_in_org"]
  is_trusted        = local.m_630["is_trusted"]
  name_alias        = local.m_630["name_alias"]
  provider_id       = local.m_630["provider_id"]
  region            = local.m_630["region"]
  secret_access_key = local.m_630["secret_access_key"]
  tenant_dn         = local.m_630["tenant_dn"]
}

output "n630_data_aci_cloud_aws_provider_id" {
  value = data.aci_cloud_aws_provider.n630.id
}
