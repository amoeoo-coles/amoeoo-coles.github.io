# 108 · resource ise_trustsec_ip_to_sgt_mapping_group · 7. TrustSec
# This resource can manage a TrustSec IP to SGT Mapping Group.
# Reads models/ise_trustsec_ip_to_sgt_mapping_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_108 = yamldecode(file("${path.module}/../models/ise_trustsec_ip_to_sgt_mapping_group.yml"))["ise_trustsec_ip_to_sgt_mapping_group"]
}

resource "ise_trustsec_ip_to_sgt_mapping_group" "n108" {
  deploy_to   = local.m_108["deploy_to"]
  deploy_type = local.m_108["deploy_type"]
  description = local.m_108["description"]
  name        = local.m_108["name"]
  sgt         = local.m_108["sgt"]
}
