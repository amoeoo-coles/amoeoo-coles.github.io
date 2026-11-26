# 366 · resource sdwan_domain_list_policy_object · 10. (Classic) policy objects
# This resource can manage a Domain List Policy Object .
# Reads models/sdwan_domain_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_366 = yamldecode(file("${path.module}/../models/sdwan_domain_list_policy_object.yml"))["sdwan_domain_list_policy_object"]
}

resource "sdwan_domain_list_policy_object" "n366" {
  entries = local.m_366["entries"]
  name = local.m_366["name"]
}
