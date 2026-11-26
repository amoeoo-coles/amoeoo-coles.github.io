# 212 · resource fmc_service_access · 2. Objects
# This resource manages a Service Access. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_service_access.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_212 = yamldecode(file("${path.module}/../models/fmc_service_access.yml"))["fmc_service_access"]
}

resource "fmc_service_access" "n212" {
  default_action = local.m_212["default_action"]
  domain         = local.m_212["domain"]
  name           = local.m_212["name"]
  rules          = local.m_212["rules"]
}
