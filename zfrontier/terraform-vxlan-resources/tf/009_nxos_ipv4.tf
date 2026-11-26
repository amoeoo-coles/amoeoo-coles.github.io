# 009 nxos_ipv4 — 2. Underlay
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/ipv4
# Reads ../models/nxos_ipv4.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_ipv4 = yamldecode(file("${path.module}/../models/nxos_ipv4.yml"))["nxos_ipv4"]
}

resource "nxos_ipv4" "this" {
  access_list_match_local                 = local.nxos_ipv4.access_list_match_local
  admin_state                             = local.nxos_ipv4.admin_state
  control                                 = local.nxos_ipv4.control
  deletion_policy                         = local.nxos_ipv4.deletion_policy
  device                                  = local.nxos_ipv4.device
  hardware_ecmp_hash_offset_concatenation = local.nxos_ipv4.hardware_ecmp_hash_offset_concatenation
  hardware_ecmp_hash_offset_value         = local.nxos_ipv4.hardware_ecmp_hash_offset_value
  hardware_ecmp_hash_polynomial           = local.nxos_ipv4.hardware_ecmp_hash_polynomial
  instance_admin_state                    = local.nxos_ipv4.instance_admin_state
  load_sharing_concatenation              = local.nxos_ipv4.load_sharing_concatenation
  load_sharing_ecmp                       = local.nxos_ipv4.load_sharing_ecmp
  load_sharing_exclude_l3_protocol        = local.nxos_ipv4.load_sharing_exclude_l3_protocol
  load_sharing_gre_outer_hash             = local.nxos_ipv4.load_sharing_gre_outer_hash
  load_sharing_keyshift                   = local.nxos_ipv4.load_sharing_keyshift
  load_sharing_mode                       = local.nxos_ipv4.load_sharing_mode
  load_sharing_rotate                     = local.nxos_ipv4.load_sharing_rotate
  load_sharing_second_hierarchy_keyshift  = local.nxos_ipv4.load_sharing_second_hierarchy_keyshift
  load_sharing_udf_length                 = local.nxos_ipv4.load_sharing_udf_length
  load_sharing_udf_offset                 = local.nxos_ipv4.load_sharing_udf_offset
  load_sharing_universal_id               = local.nxos_ipv4.load_sharing_universal_id
  logging_level                           = local.nxos_ipv4.logging_level
  redirect_syslog                         = local.nxos_ipv4.redirect_syslog
  redirect_syslog_interval                = local.nxos_ipv4.redirect_syslog_interval
  source_route                            = local.nxos_ipv4.source_route
  vrfs                                    = local.nxos_ipv4.vrfs
}
