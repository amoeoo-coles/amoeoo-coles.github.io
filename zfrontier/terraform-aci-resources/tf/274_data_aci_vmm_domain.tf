# 274 · data source aci_vmm_domain · 2. Access policies
# Data source for ACI VMM Domain
# APIC class: vmmDomP · DN: uni/vmmp-{vendor}/dom-{name}
# Reads models/data_aci_vmm_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_274 = yamldecode(file("${path.module}/../models/data_aci_vmm_domain.yml"))["data_aci_vmm_domain"]
}

data "aci_vmm_domain" "n274" {
  name      = local.m_274["name"]
  parent_dn = local.m_274["parent_dn"]
}

output "n274_data_aci_vmm_domain_id" {
  value = data.aci_vmm_domain.n274.id
}
