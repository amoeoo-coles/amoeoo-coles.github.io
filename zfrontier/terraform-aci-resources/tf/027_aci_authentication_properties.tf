# 027 · resource aci_authentication_properties · 1. System and fabric setup
# Manages ACI AAA Authentication Properties and Default Radius Authentication Settings
# APIC class: not collected · DN: not collected
# Reads models/aci_authentication_properties.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_027 = yamldecode(file("${path.module}/../models/aci_authentication_properties.yml"))["aci_authentication_properties"]
}

resource "aci_authentication_properties" "n027" {
  annotation      = local.m_027["annotation"]
  def_role_policy = local.m_027["def_role_policy"]
  description     = local.m_027["description"]
  name_alias      = local.m_027["name_alias"]
  ping_check      = local.m_027["ping_check"]
  retries         = local.m_027["retries"]
  timeout         = local.m_027["timeout"]
}
