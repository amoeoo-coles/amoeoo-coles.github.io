# 263 · resource aci_vpc_domain_policy · 2. Access policies
# Manages ACI VPC Domain Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_vpc_domain_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_263 = yamldecode(file("${path.module}/../models/aci_vpc_domain_policy.yml"))["aci_vpc_domain_policy"]
}

resource "aci_vpc_domain_policy" "n263" {
  annotation  = local.m_263["annotation"]
  dead_intvl  = local.m_263["dead_intvl"]
  description = local.m_263["description"]
  name        = local.m_263["name"]
  name_alias  = local.m_263["name_alias"]
}
