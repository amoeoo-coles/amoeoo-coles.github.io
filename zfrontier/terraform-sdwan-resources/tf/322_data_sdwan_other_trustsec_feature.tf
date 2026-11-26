# 322 · data source sdwan_other_trustsec_feature · 8. Features: CLI, topology, SIG, SSE and other
# This data source can read the Other TrustSec Feature.
# Reads models/data_sdwan_other_trustsec_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_322 = yamldecode(file("${path.module}/../models/data_sdwan_other_trustsec_feature.yml"))["data_sdwan_other_trustsec_feature"]
}

data "sdwan_other_trustsec_feature" "n322" {
  feature_profile_id = local.m_322["feature_profile_id"]
  id = local.m_322["id"]
  name = local.m_322["name"]
}

output "n322_data_sdwan_other_trustsec_feature_id" {
  value = data.sdwan_other_trustsec_feature.n322.id
}
