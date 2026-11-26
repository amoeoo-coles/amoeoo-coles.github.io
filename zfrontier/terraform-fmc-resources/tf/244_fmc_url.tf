# 244 · resource fmc_url · 2. Objects
# This resource manages an URL.
# Reads models/fmc_url.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_244 = yamldecode(file("${path.module}/../models/fmc_url.yml"))["fmc_url"]
}

resource "fmc_url" "n244" {
  description = local.m_244["description"]
  domain      = local.m_244["domain"]
  name        = local.m_244["name"]
  overridable = local.m_244["overridable"]
  url         = local.m_244["url"]
}
