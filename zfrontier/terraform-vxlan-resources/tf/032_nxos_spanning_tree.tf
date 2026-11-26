# 032 nxos_spanning_tree — 6. Interfaces and access
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/spanning_tree
# Reads ../models/nxos_spanning_tree.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_spanning_tree = yamldecode(file("${path.module}/../models/nxos_spanning_tree.yml"))["nxos_spanning_tree"]
}

resource "nxos_spanning_tree" "this" {
  admin_state              = local.nxos_spanning_tree.admin_state
  bridge_assurance         = local.nxos_spanning_tree.bridge_assurance
  control                  = local.nxos_spanning_tree.control
  deletion_policy          = local.nxos_spanning_tree.deletion_policy
  device                   = local.nxos_spanning_tree.device
  fcoe                     = local.nxos_spanning_tree.fcoe
  instance_admin_state     = local.nxos_spanning_tree.instance_admin_state
  interfaces               = local.nxos_spanning_tree.interfaces
  l2_gateway_stp_domain_id = local.nxos_spanning_tree.l2_gateway_stp_domain_id
  linecard_issu            = local.nxos_spanning_tree.linecard_issu
  loopguard                = local.nxos_spanning_tree.loopguard
  mode                     = local.nxos_spanning_tree.mode
  mst_forward_time         = local.nxos_spanning_tree.mst_forward_time
  mst_hello_time           = local.nxos_spanning_tree.mst_hello_time
  mst_instances            = local.nxos_spanning_tree.mst_instances
  mst_max_age              = local.nxos_spanning_tree.mst_max_age
  mst_maximum_hops         = local.nxos_spanning_tree.mst_maximum_hops
  mst_region_name          = local.nxos_spanning_tree.mst_region_name
  mst_revision             = local.nxos_spanning_tree.mst_revision
  mst_simulate_pvst        = local.nxos_spanning_tree.mst_simulate_pvst
  pathcost_option          = local.nxos_spanning_tree.pathcost_option
  vlans                    = local.nxos_spanning_tree.vlans
}
