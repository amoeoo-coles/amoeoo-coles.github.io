# 115 · data source ise_trustsec_security_group_acl · 7. TrustSec
# This data source can read the TrustSec Security Group ACL.
# Reads models/data_ise_trustsec_security_group_acl.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_115 = yamldecode(file("${path.module}/../models/data_ise_trustsec_security_group_acl.yml"))["data_ise_trustsec_security_group_acl"]
}

data "ise_trustsec_security_group_acl" "n115" {
  id   = local.m_115["id"]
  name = local.m_115["name"]
}

output "n115_data_ise_trustsec_security_group_acl_id" {
  value = data.ise_trustsec_security_group_acl.n115.id
}
