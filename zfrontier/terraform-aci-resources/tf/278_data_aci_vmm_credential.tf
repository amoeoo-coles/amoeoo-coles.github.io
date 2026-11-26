# 278 · data source aci_vmm_credential · 2. Access policies
# Data source for ACI VMM Credential
# APIC class: vmmUsrAccP · DN: uni/vmmp-{vendor}/dom-{name}/usracc-{name}
# Reads models/data_aci_vmm_credential.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_278 = yamldecode(file("${path.module}/../models/data_aci_vmm_credential.yml"))["data_aci_vmm_credential"]
}

data "aci_vmm_credential" "n278" {
  name      = local.m_278["name"]
  parent_dn = local.m_278["parent_dn"]
}

output "n278_data_aci_vmm_credential_id" {
  value = data.aci_vmm_credential.n278.id
}
