# 012 nxos_bfd — 2. Underlay
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/bfd
# Reads ../models/nxos_bfd.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_bfd = yamldecode(file("${path.module}/../models/nxos_bfd.yml"))["nxos_bfd"]
}

resource "nxos_bfd" "this" {
  admin_state                    = local.nxos_bfd.admin_state
  deletion_policy                = local.nxos_bfd.deletion_policy
  detect_multiplier              = local.nxos_bfd.detect_multiplier
  device                         = local.nxos_bfd.device
  echo_interface                 = local.nxos_bfd.echo_interface
  echo_receive_interval          = local.nxos_bfd.echo_receive_interval
  hardware_offload               = local.nxos_bfd.hardware_offload
  instance_admin_state           = local.nxos_bfd.instance_admin_state
  instance_control               = local.nxos_bfd.instance_control
  interfaces                     = local.nxos_bfd.interfaces
  min_receive_interval           = local.nxos_bfd.min_receive_interval
  min_transmit_interval          = local.nxos_bfd.min_transmit_interval
  multihop_detect_multiplier     = local.nxos_bfd.multihop_detect_multiplier
  multihop_min_receive_interval  = local.nxos_bfd.multihop_min_receive_interval
  multihop_min_transmit_interval = local.nxos_bfd.multihop_min_transmit_interval
  slow_interval                  = local.nxos_bfd.slow_interval
  startup_interval               = local.nxos_bfd.startup_interval
}
