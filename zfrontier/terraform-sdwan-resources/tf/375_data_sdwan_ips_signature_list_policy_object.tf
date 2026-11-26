# 375 · data source sdwan_ips_signature_list_policy_object · 10. (Classic) policy objects
# This data source can read the IPS Signature List Policy Object .
# Reads models/data_sdwan_ips_signature_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_375 = yamldecode(file("${path.module}/../models/data_sdwan_ips_signature_list_policy_object.yml"))["data_sdwan_ips_signature_list_policy_object"]
}

data "sdwan_ips_signature_list_policy_object" "n375" {
  id = local.m_375["id"]
}

output "n375_data_sdwan_ips_signature_list_policy_object_id" {
  value = data.sdwan_ips_signature_list_policy_object.n375.id
}
