# 030 · resource fmc_certificate_map · 2. Objects
# This resource manages a Certificate Map.
# Reads models/fmc_certificate_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_030 = yamldecode(file("${path.module}/../models/fmc_certificate_map.yml"))["fmc_certificate_map"]
}

resource "fmc_certificate_map" "n030" {
  domain = local.m_030["domain"]
  name   = local.m_030["name"]
  rules  = local.m_030["rules"]
}
