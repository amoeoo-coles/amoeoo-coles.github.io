# 075 · data source aci_user_security_domain_role · 1. System and fabric setup
# Data source for ACI User Security Domain Role
# APIC class: not collected · DN: not collected
# Reads models/data_aci_user_security_domain_role.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_075 = yamldecode(file("${path.module}/../models/data_aci_user_security_domain_role.yml"))["data_aci_user_security_domain_role"]
}

data "aci_user_security_domain_role" "n075" {
  annotation     = local.m_075["annotation"]
  description    = local.m_075["description"]
  name           = local.m_075["name"]
  name_alias     = local.m_075["name_alias"]
  priv_type      = local.m_075["priv_type"]
  user_domain_dn = local.m_075["user_domain_dn"]
}

output "n075_data_aci_user_security_domain_role_id" {
  value = data.aci_user_security_domain_role.n075.id
}
