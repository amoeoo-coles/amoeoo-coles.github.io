# 693 · resource aci_rest_managed · 8. Operational and utility
# Manages ACI Model Objects via REST API calls. This resource can only manage a single API object and its direct children. It is able to read the state and therefore reconcile configuration drift.
# APIC class: not collected · DN: not collected
# Reads models/aci_rest_managed.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_693 = yamldecode(file("${path.module}/../models/aci_rest_managed.yml"))["aci_rest_managed"]
}

resource "aci_rest_managed" "n693" {
  annotation         = local.m_693["annotation"]
  class_name         = local.m_693["class_name"]
  content            = local.m_693["content"]
  content_on_destroy = local.m_693["content_on_destroy"]
  dn                 = local.m_693["dn"]
  escape_html        = local.m_693["escape_html"]
  dynamic "child" {
    for_each = local.m_693["child"] == null ? [] : local.m_693["child"]
    content {
      class_name         = lookup(child.value, "class_name", null)
      content            = lookup(child.value, "content", null)
      content_on_destroy = lookup(child.value, "content_on_destroy", null)
      rn                 = lookup(child.value, "rn", null)
    }
  }
}
