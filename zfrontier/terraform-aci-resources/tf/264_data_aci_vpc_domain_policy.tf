# 264 · data source aci_vpc_domain_policy · 2. Access policies
# Data source for ACI VPC Domain Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_vpc_domain_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_264 = yamldecode(file("${path.module}/../models/data_aci_vpc_domain_policy.yml"))["data_aci_vpc_domain_policy"]
}

data "aci_vpc_domain_policy" "n264" {
  annotation  = local.m_264["annotation"]
  dead_intvl  = local.m_264["dead_intvl"]
  description = local.m_264["description"]
  name        = local.m_264["name"]
  name_alias  = local.m_264["name_alias"]
}

output "n264_data_aci_vpc_domain_policy_id" {
  value = data.aci_vpc_domain_policy.n264.id
}
