# 009 · resource fmc_application_filter · 2. Objects
# This resource manages an Application Filter.
# Reads models/fmc_application_filter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_009 = yamldecode(file("${path.module}/../models/fmc_application_filter.yml"))["fmc_application_filter"]
}

resource "fmc_application_filter" "n009" {
  applications = local.m_009["applications"]
  domain = local.m_009["domain"]
  filters = local.m_009["filters"]
  name = local.m_009["name"]
}
