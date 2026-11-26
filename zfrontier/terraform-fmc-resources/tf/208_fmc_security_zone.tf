# 208 · resource fmc_security_zone · 2. Objects
# This resource manages a Security Zone.
# Reads models/fmc_security_zone.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_208 = yamldecode(file("${path.module}/../models/fmc_security_zone.yml"))["fmc_security_zone"]
}

resource "fmc_security_zone" "n208" {
  domain = local.m_208["domain"]
  interface_type = local.m_208["interface_type"]
  name = local.m_208["name"]
}
