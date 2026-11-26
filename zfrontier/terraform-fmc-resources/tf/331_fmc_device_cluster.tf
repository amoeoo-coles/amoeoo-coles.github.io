# 331 · resource fmc_device_cluster · 4. Devices
# This device manages FTD Device Cluster configuration. Configuration of the Cluster is replicated from the Cluster Control Node. Nevertheless, please make sure that the configuration of the control and all the data nodes is consistent. The following actions are not supported: Renaming the cluster,D
# Reads models/fmc_device_cluster.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_331 = yamldecode(file("${path.module}/../models/fmc_device_cluster.yml"))["fmc_device_cluster"]
}

resource "fmc_device_cluster" "n331" {
  cluster_key = try(var.secrets["fmc_device_cluster.cluster_key"], local.m_331["cluster_key"])
  control_node_ccl_ipv4_address = local.m_331["control_node_ccl_ipv4_address"]
  control_node_ccl_prefix = local.m_331["control_node_ccl_prefix"]
  control_node_device_id = local.m_331["control_node_device_id"]
  control_node_interface_id = local.m_331["control_node_interface_id"]
  control_node_interface_name = local.m_331["control_node_interface_name"]
  control_node_interface_type = local.m_331["control_node_interface_type"]
  control_node_priority = local.m_331["control_node_priority"]
  control_node_vni_prefix = local.m_331["control_node_vni_prefix"]
  data_nodes = local.m_331["data_nodes"]
  domain = local.m_331["domain"]
  name = local.m_331["name"]
}
