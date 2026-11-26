# 688 · data source aci_file_remote_path · 8. Operational and utility
# Data source for ACI Remote Path of a File
# APIC class: not collected · DN: not collected
# Reads models/data_aci_file_remote_path.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_688 = yamldecode(file("${path.module}/../models/data_aci_file_remote_path.yml"))["data_aci_file_remote_path"]
}

data "aci_file_remote_path" "n688" {
  annotation  = local.m_688["annotation"]
  auth_type   = local.m_688["auth_type"]
  description = local.m_688["description"]
  host        = local.m_688["host"]
  name        = local.m_688["name"]
  name_alias  = local.m_688["name_alias"]
  protocol    = local.m_688["protocol"]
  remote_path = local.m_688["remote_path"]
  remote_port = local.m_688["remote_port"]
  user_name   = local.m_688["user_name"]
}

output "n688_data_aci_file_remote_path_id" {
  value = data.aci_file_remote_path.n688.id
}
