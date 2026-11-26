# 048 · resource fmc_dynamic_objects · 2. Objects
# This resource manages Dynamic Objects through bulk operations. The following restrictions apply: Updates are always done one-by-one.
# Reads models/fmc_dynamic_objects.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_048 = yamldecode(file("${path.module}/../models/fmc_dynamic_objects.yml"))["fmc_dynamic_objects"]
}

resource "fmc_dynamic_objects" "n048" {
  domain = local.m_048["domain"]
  items  = local.m_048["items"]
}
