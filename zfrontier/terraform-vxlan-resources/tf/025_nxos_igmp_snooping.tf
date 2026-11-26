# 025 nxos_igmp_snooping — 5. Networks and L2VNI
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/igmp_snooping
# Reads ../models/nxos_igmp_snooping.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_igmp_snooping = yamldecode(file("${path.module}/../models/nxos_igmp_snooping.yml"))["nxos_igmp_snooping"]
}

resource "nxos_igmp_snooping" "this" {
  admin_state                                = local.nxos_igmp_snooping.admin_state
  deletion_policy                            = local.nxos_igmp_snooping.deletion_policy
  device                                     = local.nxos_igmp_snooping.device
  domain_control                             = local.nxos_igmp_snooping.domain_control
  domain_name                                = local.nxos_igmp_snooping.domain_name
  global_vlan_disable_nve_static_router_port = local.nxos_igmp_snooping.global_vlan_disable_nve_static_router_port
  global_vlan_vxlan                          = local.nxos_igmp_snooping.global_vlan_vxlan
  global_vlan_vxlan_umc_drop_vlan            = local.nxos_igmp_snooping.global_vlan_vxlan_umc_drop_vlan
  instance_admin_state                       = local.nxos_igmp_snooping.instance_admin_state
  instance_control                           = local.nxos_igmp_snooping.instance_control
  vlans                                      = local.nxos_igmp_snooping.vlans
}
