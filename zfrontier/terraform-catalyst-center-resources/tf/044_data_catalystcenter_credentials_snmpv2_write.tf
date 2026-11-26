# 044 · data source catalystcenter_credentials_snmpv2_write · 3. Network settings and tags
# This data source can read the Credentials SNMPv2 Write.
# Reads models/data_catalystcenter_credentials_snmpv2_write.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_044 = yamldecode(file("${path.module}/../models/data_catalystcenter_credentials_snmpv2_write.yml"))["data_catalystcenter_credentials_snmpv2_write"]
}

data "catalystcenter_credentials_snmpv2_write" "n044" {
  description = local.m_044["description"]
  id          = local.m_044["id"]
}

output "n044_data_catalystcenter_credentials_snmpv2_write_id" {
  value = data.catalystcenter_credentials_snmpv2_write.n044.id
}
