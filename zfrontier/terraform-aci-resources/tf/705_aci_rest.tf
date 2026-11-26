# 705 · resource aci_rest · 9. Other
# Manages ACI Model Objects via REST API calls. Any Model Object that is not supported by provider can be created/managed using this resource.
# APIC class: not collected · DN: not collected
# Reads models/aci_rest.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_705 = yamldecode(file("${path.module}/../models/aci_rest.yml"))["aci_rest"]
}

resource "aci_rest" "n705" {
  class_name = local.m_705["class_name"]
  content    = local.m_705["content"]
  path       = local.m_705["path"]
  payload    = local.m_705["payload"]
}
