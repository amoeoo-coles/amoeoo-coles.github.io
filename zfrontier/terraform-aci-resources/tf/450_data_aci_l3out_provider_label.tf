# 450 · data source aci_l3out_provider_label · 3. Tenant and networking
# Data source for ACI L3Out Provider Label
# APIC class: l3extProvLbl · DN: uni/tn-{name}/out-{name}/provlbl-{name}
# Reads models/data_aci_l3out_provider_label.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_450 = yamldecode(file("${path.module}/../models/data_aci_l3out_provider_label.yml"))["data_aci_l3out_provider_label"]
}

data "aci_l3out_provider_label" "n450" {
  name      = local.m_450["name"]
  parent_dn = local.m_450["parent_dn"]
}

output "n450_data_aci_l3out_provider_label_id" {
  value = data.aci_l3out_provider_label.n450.id
}
