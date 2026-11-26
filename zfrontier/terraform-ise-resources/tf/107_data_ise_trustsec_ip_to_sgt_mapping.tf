# 107 · data source ise_trustsec_ip_to_sgt_mapping · 7. TrustSec
# This data source can read the TrustSec IP to SGT Mapping.
# Reads models/data_ise_trustsec_ip_to_sgt_mapping.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_107 = yamldecode(file("${path.module}/../models/data_ise_trustsec_ip_to_sgt_mapping.yml"))["data_ise_trustsec_ip_to_sgt_mapping"]
}

data "ise_trustsec_ip_to_sgt_mapping" "n107" {
  id = local.m_107["id"]
  name = local.m_107["name"]
}

output "n107_data_ise_trustsec_ip_to_sgt_mapping_id" {
  value = data.ise_trustsec_ip_to_sgt_mapping.n107.id
}
