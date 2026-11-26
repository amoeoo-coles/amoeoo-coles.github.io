# 083 · data source catalystcenter_network_devices · 4. Discovery, inventory and PnP
# This data source fetches all network devices defined on the Catalyst Center. This data source does not report physical location (site) information. Obtain it instead from the data source data.catalystcenter_device_detail. To determine physical locations of multiple devices use the same data source
# Reads models/data_catalystcenter_network_devices.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_083 = yamldecode(file("${path.module}/../models/data_catalystcenter_network_devices.yml"))["data_catalystcenter_network_devices"]
}

data "catalystcenter_network_devices" "n083" {
}
