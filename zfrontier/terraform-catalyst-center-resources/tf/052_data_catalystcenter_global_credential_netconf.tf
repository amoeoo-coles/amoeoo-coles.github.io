# 052 · data source catalystcenter_global_credential_netconf · 3. Network settings and tags
# This data source can read the Global Credential NETCONF.
# Reads models/data_catalystcenter_global_credential_netconf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_052 = yamldecode(file("${path.module}/../models/data_catalystcenter_global_credential_netconf.yml"))["data_catalystcenter_global_credential_netconf"]
}

data "catalystcenter_global_credential_netconf" "n052" {
  id = local.m_052["id"]
}

output "n052_data_catalystcenter_global_credential_netconf_id" {
  value = data.catalystcenter_global_credential_netconf.n052.id
}
