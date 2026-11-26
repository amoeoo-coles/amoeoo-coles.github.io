# 387 · data source sdwan_port_list_policy_object · 10. (Classic) policy objects
# This data source can read the Port List Policy Object .
# Reads models/data_sdwan_port_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_387 = yamldecode(file("${path.module}/../models/data_sdwan_port_list_policy_object.yml"))["data_sdwan_port_list_policy_object"]
}

data "sdwan_port_list_policy_object" "n387" {
  id = local.m_387["id"]
}

output "n387_data_sdwan_port_list_policy_object_id" {
  value = data.sdwan_port_list_policy_object.n387.id
}
