# Sample data source intersight_niatelemetry_nia_inventory — reads ../models/data_intersight_niatelemetry_nia_inventory.yml
locals { m983 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_nia_inventory.yml"))["data_intersight_niatelemetry_nia_inventory"] }

data "intersight_niatelemetry_nia_inventory" "n983" {
  account_moid = try(local.m983["account_moid"], null)
  additional_properties = try(local.m983["additional_properties"], null)
  class_id = try(local.m983["class_id"], null)
  controller_ip_address = try(local.m983["controller_ip_address"], null)
  cpu = try(local.m983["cpu"], null)
  crash_reset_logs = try(local.m983["crash_reset_logs"], null)
  create_time = try(local.m983["create_time"], null)
  customer_device_connector = try(local.m983["customer_device_connector"], null)
  dcnm_license_state = try(local.m983["dcnm_license_state"], null)
  device_discovery = try(local.m983["device_discovery"], null)
  device_health = try(local.m983["device_health"], null)
  device_id = try(local.m983["device_id"], null)
  device_name = try(local.m983["device_name"], null)
  device_type = try(local.m983["device_type"], null)
  device_up_time = try(local.m983["device_up_time"], null)
  dn = try(local.m983["dn"], null)
  domain_group_moid = try(local.m983["domain_group_moid"], null)
  fabric_name = try(local.m983["fabric_name"], null)
  fex_count = try(local.m983["fex_count"], null)
  id = try(local.m983["id"], null)
  infra_wi_node_count = try(local.m983["infra_wi_node_count"], null)
  ip_address = try(local.m983["ip_address"], null)
  is_virtual_node = try(local.m983["is_virtual_node"], null)
  last_reboot_time = try(local.m983["last_reboot_time"], null)
  last_reset_reason = try(local.m983["last_reset_reason"], null)
  license_type = try(local.m983["license_type"], null)
  log_in_time = try(local.m983["log_in_time"], null)
  log_out_time = try(local.m983["log_out_time"], null)
  mac_sec_count = try(local.m983["mac_sec_count"], null)
  mac_sec_fab_count = try(local.m983["mac_sec_fab_count"], null)
  macsec_total_count = try(local.m983["macsec_total_count"], null)
  memory = try(local.m983["memory"], null)
  mod_time = try(local.m983["mod_time"], null)
  moid = try(local.m983["moid"], null)
  nexus_cloud_membership_status = try(local.m983["nexus_cloud_membership_status"], null)
  node_id = try(local.m983["node_id"], null)
  nr_version = try(local.m983["nr_version"], null)
  nxos_dci_interface_status = try(local.m983["nxos_dci_interface_status"], null)
  nxos_nve_interface_status = try(local.m983["nxos_nve_interface_status"], null)
  nxos_ospf_neighbors = try(local.m983["nxos_ospf_neighbors"], null)
  nxos_pim_neighbors = try(local.m983["nxos_pim_neighbors"], null)
  nxos_telnet = try(local.m983["nxos_telnet"], null)
  nxos_total_routes = try(local.m983["nxos_total_routes"], null)
  object_type = try(local.m983["object_type"], null)
  owners = try(local.m983["owners"], null)
  record_type = try(local.m983["record_type"], null)
  record_version = try(local.m983["record_version"], null)
  results = try(local.m983["results"], null)
  route_prefix_count = try(local.m983["route_prefix_count"], null)
  route_prefix_v4_count = try(local.m983["route_prefix_v4_count"], null)
  route_prefix_v6_count = try(local.m983["route_prefix_v6_count"], null)
  serial = try(local.m983["serial"], null)
  shared_scope = try(local.m983["shared_scope"], null)
  site_name = try(local.m983["site_name"], null)
  siteuuid = try(local.m983["siteuuid"], null)
  smart_account_id = try(local.m983["smart_account_id"], null)
  software_download = try(local.m983["software_download"], null)
  system_up_time = try(local.m983["system_up_time"], null)
  vpc_peer_ip_address = try(local.m983["vpc_peer_ip_address"], null)
  dynamic "ancestors" {
    for_each = try(local.m983["ancestors"], null) == null ? [] : local.m983["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "dcnm_fan_details" {
    for_each = try(local.m983["dcnm_fan_details"], null) == null ? [] : local.m983["dcnm_fan_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disk" {
    for_each = try(local.m983["disk"], null) == null ? [] : local.m983["disk"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "interface" {
    for_each = try(local.m983["interface"], null) == null ? [] : local.m983["interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "license_state" {
    for_each = try(local.m983["license_state"], null) == null ? [] : local.m983["license_state"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nxos_bgp_evpn" {
    for_each = try(local.m983["nxos_bgp_evpn"], null) == null ? [] : local.m983["nxos_bgp_evpn"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nxos_bgp_mvpn" {
    for_each = try(local.m983["nxos_bgp_mvpn"], null) == null ? [] : local.m983["nxos_bgp_mvpn"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nxos_bootflash_details" {
    for_each = try(local.m983["nxos_bootflash_details"], null) == null ? [] : local.m983["nxos_bootflash_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nxos_interface_brief" {
    for_each = try(local.m983["nxos_interface_brief"], null) == null ? [] : local.m983["nxos_interface_brief"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nxos_module_details" {
    for_each = try(local.m983["nxos_module_details"], null) == null ? [] : local.m983["nxos_module_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nxos_nve_packet_counters" {
    for_each = try(local.m983["nxos_nve_packet_counters"], null) == null ? [] : local.m983["nxos_nve_packet_counters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nxos_nve_vni" {
    for_each = try(local.m983["nxos_nve_vni"], null) == null ? [] : local.m983["nxos_nve_vni"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nxos_vtp" {
    for_each = try(local.m983["nxos_vtp"], null) == null ? [] : local.m983["nxos_vtp"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m983["parent"], null) == null ? [] : local.m983["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m983["permission_resources"], null) == null ? [] : local.m983["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m983["registered_device"], null) == null ? [] : local.m983["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m983["tags"], null) == null ? [] : local.m983["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m983["version_context"], null) == null ? [] : local.m983["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vni_status" {
    for_each = try(local.m983["vni_status"], null) == null ? [] : local.m983["vni_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
