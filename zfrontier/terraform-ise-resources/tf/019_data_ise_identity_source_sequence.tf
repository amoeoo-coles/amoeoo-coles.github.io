# 019 · data source ise_identity_source_sequence · 2. Identity management
# This data source can read the Identity Source Sequence.
# Reads models/data_ise_identity_source_sequence.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_019 = yamldecode(file("${path.module}/../models/data_ise_identity_source_sequence.yml"))["data_ise_identity_source_sequence"]
}

data "ise_identity_source_sequence" "n019" {
  id   = local.m_019["id"]
  name = local.m_019["name"]
}

output "n019_data_ise_identity_source_sequence_id" {
  value = data.ise_identity_source_sequence.n019.id
}
