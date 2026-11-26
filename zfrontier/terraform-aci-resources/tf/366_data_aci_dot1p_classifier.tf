# 366 · data source aci_dot1p_classifier · 3. Tenant and networking
# Data source for ACI Dot1p Classifier
# APIC class: qosDot1PClass · DN: uni/tn-{name}/qoscustom-{name}/dot1P-{from}-{to}
# Reads models/data_aci_dot1p_classifier.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_366 = yamldecode(file("${path.module}/../models/data_aci_dot1p_classifier.yml"))["data_aci_dot1p_classifier"]
}

data "aci_dot1p_classifier" "n366" {
  from      = local.m_366["from"]
  parent_dn = local.m_366["parent_dn"]
  to        = local.m_366["to"]
}

output "n366_data_aci_dot1p_classifier_id" {
  value = data.aci_dot1p_classifier.n366.id
}
