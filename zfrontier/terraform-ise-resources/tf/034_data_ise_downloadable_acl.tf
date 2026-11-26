# 034 · data source ise_downloadable_acl · 5. Network access
# This data source can read the Downloadable ACL.
# Reads models/data_ise_downloadable_acl.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_034 = yamldecode(file("${path.module}/../models/data_ise_downloadable_acl.yml"))["data_ise_downloadable_acl"]
}

data "ise_downloadable_acl" "n034" {
  id   = local.m_034["id"]
  name = local.m_034["name"]
}

output "n034_data_ise_downloadable_acl_id" {
  value = data.ise_downloadable_acl.n034.id
}
