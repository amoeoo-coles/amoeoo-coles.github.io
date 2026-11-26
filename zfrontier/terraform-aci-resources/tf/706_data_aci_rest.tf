# 706 · data source aci_rest · 9. Other
# Data source for ACI Rest
# APIC class: not collected · DN: not collected
# Reads models/data_aci_rest.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_706 = yamldecode(file("${path.module}/../models/data_aci_rest.yml"))["data_aci_rest"]
}

data "aci_rest" "n706" {
  class_name = local.m_706["class_name"]
  content    = local.m_706["content"]
  dn         = local.m_706["dn"]
  path       = local.m_706["path"]
  dynamic "children" {
    for_each = local.m_706["children"] == null ? [] : local.m_706["children"]
    content {
      child_class_name = lookup(children.value, "child_class_name", null)
      child_content    = lookup(children.value, "child_content", null)
    }
  }
}

output "n706_data_aci_rest_id" {
  value = data.aci_rest.n706.id
}
