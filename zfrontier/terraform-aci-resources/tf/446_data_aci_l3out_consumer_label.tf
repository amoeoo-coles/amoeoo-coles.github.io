# 446 · data source aci_l3out_consumer_label · 3. Tenant and networking
# Data source for ACI L3Out Consumer Label
# APIC class: l3extConsLbl · DN: uni/tn-{name}/out-{name}/conslbl-{name}
# Reads models/data_aci_l3out_consumer_label.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_446 = yamldecode(file("${path.module}/../models/data_aci_l3out_consumer_label.yml"))["data_aci_l3out_consumer_label"]
}

data "aci_l3out_consumer_label" "n446" {
  name      = local.m_446["name"]
  parent_dn = local.m_446["parent_dn"]
}

output "n446_data_aci_l3out_consumer_label_id" {
  value = data.aci_l3out_consumer_label.n446.id
}
