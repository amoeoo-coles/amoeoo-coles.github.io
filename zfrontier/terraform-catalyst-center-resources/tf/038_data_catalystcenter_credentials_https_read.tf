# 038 · data source catalystcenter_credentials_https_read · 3. Network settings and tags
# This data source can read the Credentials HTTPS Read.
# Reads models/data_catalystcenter_credentials_https_read.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_038 = yamldecode(file("${path.module}/../models/data_catalystcenter_credentials_https_read.yml"))["data_catalystcenter_credentials_https_read"]
}

data "catalystcenter_credentials_https_read" "n038" {
  description = local.m_038["description"]
  id = local.m_038["id"]
}

output "n038_data_catalystcenter_credentials_https_read_id" {
  value = data.catalystcenter_credentials_https_read.n038.id
}
