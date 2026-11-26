# 105 · resource ise_trustsec_egress_push_matrix · 7. TrustSec
# This resource triggers a CoA notification on TrustSec Policy, SGACL, or TrustSec Environment Data updates
# Reads models/ise_trustsec_egress_push_matrix.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_105 = yamldecode(file("${path.module}/../models/ise_trustsec_egress_push_matrix.yml"))["ise_trustsec_egress_push_matrix"]
}

resource "ise_trustsec_egress_push_matrix" "n105" {
  force = local.m_105["force"]
}
