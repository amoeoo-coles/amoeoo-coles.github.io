# 380 · resource sdwan_local_application_list_policy_object · 10. (Classic) policy objects
# This resource can manage a Local Application List Policy Object .
# Reads models/sdwan_local_application_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_380 = yamldecode(file("${path.module}/../models/sdwan_local_application_list_policy_object.yml"))["sdwan_local_application_list_policy_object"]
}

resource "sdwan_local_application_list_policy_object" "n380" {
  entries = local.m_380["entries"]
  name = local.m_380["name"]
}
