# 046 · data source catalystcenter_credentials_snmpv3 · 3. Network settings and tags
# This data source can read the Credentials SNMPv3.
# Reads models/data_catalystcenter_credentials_snmpv3.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_046 = yamldecode(file("${path.module}/../models/data_catalystcenter_credentials_snmpv3.yml"))["data_catalystcenter_credentials_snmpv3"]
}

data "catalystcenter_credentials_snmpv3" "n046" {
  description = local.m_046["description"]
  id = local.m_046["id"]
}

output "n046_data_catalystcenter_credentials_snmpv3_id" {
  value = data.catalystcenter_credentials_snmpv3.n046.id
}
