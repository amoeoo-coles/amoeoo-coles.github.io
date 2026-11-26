# 097 · resource fmc_ikev1_policies · 2. Objects
# This resource manages IKEv1 Policies through bulk operations. The following restrictions apply: Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_ikev1_policies.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_097 = yamldecode(file("${path.module}/../models/fmc_ikev1_policies.yml"))["fmc_ikev1_policies"]
}

resource "fmc_ikev1_policies" "n097" {
  domain = local.m_097["domain"]
  items  = local.m_097["items"]
}
