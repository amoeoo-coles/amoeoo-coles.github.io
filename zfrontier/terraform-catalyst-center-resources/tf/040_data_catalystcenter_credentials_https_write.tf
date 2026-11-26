# 040 · data source catalystcenter_credentials_https_write · 3. Network settings and tags
# This data source can read the Credentials HTTPS Write.
# Reads models/data_catalystcenter_credentials_https_write.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_040 = yamldecode(file("${path.module}/../models/data_catalystcenter_credentials_https_write.yml"))["data_catalystcenter_credentials_https_write"]
}

data "catalystcenter_credentials_https_write" "n040" {
  description = local.m_040["description"]
  id = local.m_040["id"]
}

output "n040_data_catalystcenter_credentials_https_write_id" {
  value = data.catalystcenter_credentials_https_write.n040.id
}
