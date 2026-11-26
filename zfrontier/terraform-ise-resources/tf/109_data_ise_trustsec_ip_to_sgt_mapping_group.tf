# 109 · data source ise_trustsec_ip_to_sgt_mapping_group · 7. TrustSec
# This data source can read the TrustSec IP to SGT Mapping Group.
# Reads models/data_ise_trustsec_ip_to_sgt_mapping_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_109 = yamldecode(file("${path.module}/../models/data_ise_trustsec_ip_to_sgt_mapping_group.yml"))["data_ise_trustsec_ip_to_sgt_mapping_group"]
}

data "ise_trustsec_ip_to_sgt_mapping_group" "n109" {
  id = local.m_109["id"]
  name = local.m_109["name"]
}

output "n109_data_ise_trustsec_ip_to_sgt_mapping_group_id" {
  value = data.ise_trustsec_ip_to_sgt_mapping_group.n109.id
}
