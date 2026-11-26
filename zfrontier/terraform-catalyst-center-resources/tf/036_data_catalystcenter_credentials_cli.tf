# 036 · data source catalystcenter_credentials_cli · 3. Network settings and tags
# This data source can read the Credentials CLI.
# Reads models/data_catalystcenter_credentials_cli.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_036 = yamldecode(file("${path.module}/../models/data_catalystcenter_credentials_cli.yml"))["data_catalystcenter_credentials_cli"]
}

data "catalystcenter_credentials_cli" "n036" {
  description = local.m_036["description"]
  id = local.m_036["id"]
}

output "n036_data_catalystcenter_credentials_cli_id" {
  value = data.catalystcenter_credentials_cli.n036.id
}
