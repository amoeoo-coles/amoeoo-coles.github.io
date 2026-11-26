# 694 · data source aci_rest_managed · 8. Operational and utility
# This data source can read one ACI object and its children.
# APIC class: not collected · DN: not collected
# Reads models/data_aci_rest_managed.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_694 = yamldecode(file("${path.module}/../models/data_aci_rest_managed.yml"))["data_aci_rest_managed"]
}

data "aci_rest_managed" "n694" {
  dn = local.m_694["dn"]
  dynamic "child" {
    for_each = local.m_694["child"] == null ? [] : local.m_694["child"]
    content {
    }
  }
}

output "n694_data_aci_rest_managed_id" {
  value = data.aci_rest_managed.n694.id
}
