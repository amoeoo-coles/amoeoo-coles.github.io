# 023 nxos_hmm — 5. Networks and L2VNI
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/hmm
# Reads ../models/nxos_hmm.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_hmm = yamldecode(file("${path.module}/../models/nxos_hmm.yml"))["nxos_hmm"]
}

resource "nxos_hmm" "this" {
  admin_state                      = local.nxos_hmm.admin_state
  administrative_distance          = local.nxos_hmm.administrative_distance
  anycast_mac                      = local.nxos_hmm.anycast_mac
  control                          = local.nxos_hmm.control
  deletion_policy                  = local.nxos_hmm.deletion_policy
  device                           = local.nxos_hmm.device
  duplicate_host_detection_moves   = local.nxos_hmm.duplicate_host_detection_moves
  duplicate_host_detection_seconds = local.nxos_hmm.duplicate_host_detection_seconds
  duplicate_host_recovery_count    = local.nxos_hmm.duplicate_host_recovery_count
  duplicate_host_recovery_timeout  = local.nxos_hmm.duplicate_host_recovery_timeout
  evpn_admin_state                 = local.nxos_hmm.evpn_admin_state
  evpn_control                     = local.nxos_hmm.evpn_control
  instance_admin_state             = local.nxos_hmm.instance_admin_state
  interfaces                       = local.nxos_hmm.interfaces
  limit_vlan_mac                   = local.nxos_hmm.limit_vlan_mac
  selective_host_probe             = local.nxos_hmm.selective_host_probe
}
