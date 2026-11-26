# 314 · data source sdwan_sig_feature · 8. Features: CLI, topology, SIG, SSE and other
# This data source can read the SIG (Secure Internet Gateway) Feature.
# Reads models/data_sdwan_sig_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_314 = yamldecode(file("${path.module}/../models/data_sdwan_sig_feature.yml"))["data_sdwan_sig_feature"]
}

data "sdwan_sig_feature" "n314" {
  feature_profile_id = local.m_314["feature_profile_id"]
  id = local.m_314["id"]
  name = local.m_314["name"]
}

output "n314_data_sdwan_sig_feature_id" {
  value = data.sdwan_sig_feature.n314.id
}
