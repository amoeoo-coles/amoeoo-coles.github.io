# 067 · resource fmc_fqdn · 2. Objects
# This resource manages a FQDN (Fully Qualified Domain Name) Object.
# Reads models/fmc_fqdn.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_067 = yamldecode(file("${path.module}/../models/fmc_fqdn.yml"))["fmc_fqdn"]
}

resource "fmc_fqdn" "n067" {
  description = local.m_067["description"]
  dns_resolution = local.m_067["dns_resolution"]
  domain = local.m_067["domain"]
  fqdn = local.m_067["fqdn"]
  name = local.m_067["name"]
  overridable = local.m_067["overridable"]
}
