# 248 · resource fmc_url_group · 2. Objects
# This resource manages an URL Group.
# Reads models/fmc_url_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_248 = yamldecode(file("${path.module}/../models/fmc_url_group.yml"))["fmc_url_group"]
}

resource "fmc_url_group" "n248" {
  description = local.m_248["description"]
  domain      = local.m_248["domain"]
  literals    = local.m_248["literals"]
  name        = local.m_248["name"]
  overridable = local.m_248["overridable"]
  urls        = local.m_248["urls"]
}
