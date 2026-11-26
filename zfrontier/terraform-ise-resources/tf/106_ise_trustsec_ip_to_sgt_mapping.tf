# 106 · resource ise_trustsec_ip_to_sgt_mapping · 7. TrustSec
# This resource can manage a TrustSec IP to SGT Mapping.
# Reads models/ise_trustsec_ip_to_sgt_mapping.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_106 = yamldecode(file("${path.module}/../models/ise_trustsec_ip_to_sgt_mapping.yml"))["ise_trustsec_ip_to_sgt_mapping"]
}

resource "ise_trustsec_ip_to_sgt_mapping" "n106" {
  deploy_to = local.m_106["deploy_to"]
  deploy_type = local.m_106["deploy_type"]
  description = local.m_106["description"]
  host_ip = local.m_106["host_ip"]
  host_name = local.m_106["host_name"]
  mapping_group = local.m_106["mapping_group"]
  name = local.m_106["name"]
  sgt = local.m_106["sgt"]
}
