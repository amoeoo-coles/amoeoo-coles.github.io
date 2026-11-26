# 689 · resource aci_annotation · 8. Operational and utility
# Manages ACI Annotation
# APIC class: tagAnnotation · DN: not collected
# Reads models/aci_annotation.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_689 = yamldecode(file("${path.module}/../models/aci_annotation.yml"))["aci_annotation"]
}

resource "aci_annotation" "n689" {
  key       = local.m_689["key"]
  parent_dn = local.m_689["parent_dn"]
  value     = local.m_689["value"]
}
