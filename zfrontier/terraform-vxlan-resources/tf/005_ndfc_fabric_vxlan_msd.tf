# 005 ndfc_fabric_vxlan_msd — 1. Global, fabric and features
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/fabric_vxlan_msd
# Reads ../models/ndfc_fabric_vxlan_msd.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_fabric_vxlan_msd = yamldecode(file("${path.module}/../models/ndfc_fabric_vxlan_msd.yml"))["ndfc_fabric_vxlan_msd"]
}

resource "ndfc_fabric_vxlan_msd" "this" {
  anycast_gw_mac                 = local.ndfc_fabric_vxlan_msd.anycast_gw_mac
  bgp_rp_asn                     = local.ndfc_fabric_vxlan_msd.bgp_rp_asn
  bgw_routing_tag                = local.ndfc_fabric_vxlan_msd.bgw_routing_tag
  border_gwy_connections         = local.ndfc_fabric_vxlan_msd.border_gwy_connections
  child_fabrics                  = local.ndfc_fabric_vxlan_msd.child_fabrics
  cloudsec_algorithm             = local.ndfc_fabric_vxlan_msd.cloudsec_algorithm
  cloudsec_autoconfig            = local.ndfc_fabric_vxlan_msd.cloudsec_autoconfig
  cloudsec_enforcement           = local.ndfc_fabric_vxlan_msd.cloudsec_enforcement
  cloudsec_key_string            = local.ndfc_fabric_vxlan_msd.cloudsec_key_string
  cloudsec_report_timer          = local.ndfc_fabric_vxlan_msd.cloudsec_report_timer
  dci_subnet_range               = local.ndfc_fabric_vxlan_msd.dci_subnet_range
  dci_subnet_target_mask         = local.ndfc_fabric_vxlan_msd.dci_subnet_target_mask
  default_network                = local.ndfc_fabric_vxlan_msd.default_network
  default_pvlan_sec_network      = local.ndfc_fabric_vxlan_msd.default_pvlan_sec_network
  default_vrf                    = local.ndfc_fabric_vxlan_msd.default_vrf
  delay_restore                  = local.ndfc_fabric_vxlan_msd.delay_restore
  deploy                         = local.ndfc_fabric_vxlan_msd.deploy
  enable_bgp_bfd                 = local.ndfc_fabric_vxlan_msd.enable_bgp_bfd
  enable_bgp_log_neighbor_change = local.ndfc_fabric_vxlan_msd.enable_bgp_log_neighbor_change
  enable_bgp_send_comm           = local.ndfc_fabric_vxlan_msd.enable_bgp_send_comm
  enable_pvlan                   = local.ndfc_fabric_vxlan_msd.enable_pvlan
  enable_rs_redist_direct        = local.ndfc_fabric_vxlan_msd.enable_rs_redist_direct
  enable_scheduled_backup        = local.ndfc_fabric_vxlan_msd.enable_scheduled_backup
  enable_sgt                     = local.ndfc_fabric_vxlan_msd.enable_sgt
  enable_trm_trmv6               = local.ndfc_fabric_vxlan_msd.enable_trm_trmv6
  ext_fabric_type                = local.ndfc_fabric_vxlan_msd.ext_fabric_type
  fabric_name                    = local.ndfc_fabric_vxlan_msd.fabric_name
  ff                             = local.ndfc_fabric_vxlan_msd.ff
  l2_segment_id_range            = local.ndfc_fabric_vxlan_msd.l2_segment_id_range
  l3_partition_id_range          = local.ndfc_fabric_vxlan_msd.l3_partition_id_range
  loopback100_ip_range           = local.ndfc_fabric_vxlan_msd.loopback100_ip_range
  loopback100_ipv6_range         = local.ndfc_fabric_vxlan_msd.loopback100_ipv6_range
  ms_ifc_bgp_auth_key_type       = local.ndfc_fabric_vxlan_msd.ms_ifc_bgp_auth_key_type
  ms_ifc_bgp_password            = local.ndfc_fabric_vxlan_msd.ms_ifc_bgp_password
  ms_ifc_bgp_password_enable     = local.ndfc_fabric_vxlan_msd.ms_ifc_bgp_password_enable
  ms_loopback_id                 = local.ndfc_fabric_vxlan_msd.ms_loopback_id
  ms_underlay_autoconfig         = local.ndfc_fabric_vxlan_msd.ms_underlay_autoconfig
  network_extension_template     = local.ndfc_fabric_vxlan_msd.network_extension_template
  rp_server_ip                   = local.ndfc_fabric_vxlan_msd.rp_server_ip
  rs_routing_tag                 = local.ndfc_fabric_vxlan_msd.rs_routing_tag
  scheduled_time                 = local.ndfc_fabric_vxlan_msd.scheduled_time
  sgt_id_range                   = local.ndfc_fabric_vxlan_msd.sgt_id_range
  sgt_name_prefix                = local.ndfc_fabric_vxlan_msd.sgt_name_prefix
  sgt_preprovision               = local.ndfc_fabric_vxlan_msd.sgt_preprovision
  tor_auto_deploy                = local.ndfc_fabric_vxlan_msd.tor_auto_deploy
  v6_dci_subnet_range            = local.ndfc_fabric_vxlan_msd.v6_dci_subnet_range
  v6_dci_subnet_target_mask      = local.ndfc_fabric_vxlan_msd.v6_dci_subnet_target_mask
  vrf_extension_template         = local.ndfc_fabric_vxlan_msd.vrf_extension_template
  vxlan_underlay_is_v6           = local.ndfc_fabric_vxlan_msd.vxlan_underlay_is_v6
}
