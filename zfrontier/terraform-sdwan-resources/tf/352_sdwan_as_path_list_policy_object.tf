# 352 · resource sdwan_as_path_list_policy_object · 10. (Classic) policy objects
# This resource can manage a AS Path List Policy Object .
# Reads models/sdwan_as_path_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_352 = yamldecode(file("${path.module}/../models/sdwan_as_path_list_policy_object.yml"))["sdwan_as_path_list_policy_object"]
}

resource "sdwan_as_path_list_policy_object" "n352" {
  entries = local.m_352["entries"]
  name = local.m_352["name"]
}
