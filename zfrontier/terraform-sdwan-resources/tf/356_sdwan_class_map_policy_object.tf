# 356 · resource sdwan_class_map_policy_object · 10. (Classic) policy objects
# This resource can manage a Class Map Policy Object .
# Reads models/sdwan_class_map_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_356 = yamldecode(file("${path.module}/../models/sdwan_class_map_policy_object.yml"))["sdwan_class_map_policy_object"]
}

resource "sdwan_class_map_policy_object" "n356" {
  name  = local.m_356["name"]
  queue = local.m_356["queue"]
}
