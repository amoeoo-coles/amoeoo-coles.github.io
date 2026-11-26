# 669 · resource aci_cloud_domain_profile · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud Domain Profile
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_domain_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_669 = yamldecode(file("${path.module}/../models/aci_cloud_domain_profile.yml"))["aci_cloud_domain_profile"]
}

resource "aci_cloud_domain_profile" "n669" {
  annotation  = local.m_669["annotation"]
  description = local.m_669["description"]
  name_alias  = local.m_669["name_alias"]
  site_id     = local.m_669["site_id"]
}
