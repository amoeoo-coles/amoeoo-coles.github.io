# 193 · resource catalystcenter_application_set · 9. Application policy
# Manages a custom Catalyst Center Application Set. Built-in application sets must not be managed by this resource. The API does not support updates, so changing a configurable attribute replaces the application set. terraform import expects the controller-assigned UUID.
# Reads models/catalystcenter_application_set.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_193 = yamldecode(file("${path.module}/../models/catalystcenter_application_set.yml"))["catalystcenter_application_set"]
}

resource "catalystcenter_application_set" "n193" {
  default_business_relevance     = local.m_193["default_business_relevance"]
  name                           = local.m_193["name"]
  scalable_group_external_handle = local.m_193["scalable_group_external_handle"]
}
