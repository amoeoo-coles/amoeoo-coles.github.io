# 042 · data source catalystcenter_credentials_snmpv2_read · 3. Network settings and tags
# This data source can read the Credentials SNMPv2 Read.
# Reads models/data_catalystcenter_credentials_snmpv2_read.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_042 = yamldecode(file("${path.module}/../models/data_catalystcenter_credentials_snmpv2_read.yml"))["data_catalystcenter_credentials_snmpv2_read"]
}

data "catalystcenter_credentials_snmpv2_read" "n042" {
  description = local.m_042["description"]
  id = local.m_042["id"]
}

output "n042_data_catalystcenter_credentials_snmpv2_read_id" {
  value = data.catalystcenter_credentials_snmpv2_read.n042.id
}
