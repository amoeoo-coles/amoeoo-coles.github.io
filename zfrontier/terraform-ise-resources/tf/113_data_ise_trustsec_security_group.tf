# 113 · data source ise_trustsec_security_group · 7. TrustSec
# This data source can read the TrustSec Security Group.
# Reads models/data_ise_trustsec_security_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_113 = yamldecode(file("${path.module}/../models/data_ise_trustsec_security_group.yml"))["data_ise_trustsec_security_group"]
}

data "ise_trustsec_security_group" "n113" {
  id   = local.m_113["id"]
  name = local.m_113["name"]
}

output "n113_data_ise_trustsec_security_group_id" {
  value = data.ise_trustsec_security_group.n113.id
}
