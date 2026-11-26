# 105 · resource fmc_ikev2_policies · 2. Objects
# This resource manages IKEv2 Policies through bulk operations. The following restrictions apply: Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_ikev2_policies.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_105 = yamldecode(file("${path.module}/../models/fmc_ikev2_policies.yml"))["fmc_ikev2_policies"]
}

resource "fmc_ikev2_policies" "n105" {
  domain = local.m_105["domain"]
  items = local.m_105["items"]
}
