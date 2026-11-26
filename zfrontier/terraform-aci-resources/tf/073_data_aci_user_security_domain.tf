# 073 · data source aci_user_security_domain · 1. System and fabric setup
# Data source for ACI User Security Domain
# APIC class: not collected · DN: not collected
# Reads models/data_aci_user_security_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_073 = yamldecode(file("${path.module}/../models/data_aci_user_security_domain.yml"))["data_aci_user_security_domain"]
}

data "aci_user_security_domain" "n073" {
  annotation    = local.m_073["annotation"]
  description   = local.m_073["description"]
  local_user_dn = local.m_073["local_user_dn"]
  name          = local.m_073["name"]
  name_alias    = local.m_073["name_alias"]
}

output "n073_data_aci_user_security_domain_id" {
  value = data.aci_user_security_domain.n073.id
}
