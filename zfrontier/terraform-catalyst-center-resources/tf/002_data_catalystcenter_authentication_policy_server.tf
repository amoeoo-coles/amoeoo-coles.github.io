# 002 · data source catalystcenter_authentication_policy_server · 1. System
# This data source can read the Authentication Policy Server.
# Reads models/data_catalystcenter_authentication_policy_server.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_002 = yamldecode(file("${path.module}/../models/data_catalystcenter_authentication_policy_server.yml"))["data_catalystcenter_authentication_policy_server"]
}

data "catalystcenter_authentication_policy_server" "n002" {
  id = local.m_002["id"]
}

output "n002_data_catalystcenter_authentication_policy_server_id" {
  value = data.catalystcenter_authentication_policy_server.n002.id
}
