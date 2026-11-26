# 690 · data source aci_annotation · 8. Operational and utility
# Data source for ACI Annotation
# APIC class: tagAnnotation · DN: not collected
# Reads models/data_aci_annotation.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_690 = yamldecode(file("${path.module}/../models/data_aci_annotation.yml"))["data_aci_annotation"]
}

data "aci_annotation" "n690" {
  key       = local.m_690["key"]
  parent_dn = local.m_690["parent_dn"]
}

output "n690_data_aci_annotation_id" {
  value = data.aci_annotation.n690.id
}
