# 506 · data source aci_application_profile · 4. Application
# Data source for ACI Application Profile
# APIC class: fvAp · DN: uni/tn-{name}/ap-{name}
# Reads models/data_aci_application_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_506 = yamldecode(file("${path.module}/../models/data_aci_application_profile.yml"))["data_aci_application_profile"]
}

data "aci_application_profile" "n506" {
  name      = local.m_506["name"]
  parent_dn = local.m_506["parent_dn"]
}

output "n506_data_aci_application_profile_id" {
  value = data.aci_application_profile.n506.id
}
