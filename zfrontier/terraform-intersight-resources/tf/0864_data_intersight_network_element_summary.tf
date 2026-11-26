# Sample data source intersight_network_element_summary — reads ../models/data_intersight_network_element_summary.yml
locals { m864 = yamldecode(file("${path.module}/../models/data_intersight_network_element_summary.yml"))["data_intersight_network_element_summary"] }

data "intersight_network_element_summary" "n864" {
  account_moid = try(local.m864["account_moid"], null)
  additional_properties = try(local.m864["additional_properties"], null)
  admin_evac_state = try(local.m864["admin_evac_state"], null)
  admin_inband_interface_state = try(local.m864["admin_inband_interface_state"], null)
  available_memory = try(local.m864["available_memory"], null)
  bundle_version = try(local.m864["bundle_version"], null)
  cdp_enabled = try(local.m864["cdp_enabled"], null)
  chassis = try(local.m864["chassis"], null)
  class_id = try(local.m864["class_id"], null)
  conf_mod_ts = try(local.m864["conf_mod_ts"], null)
  conf_mod_ts_backup = try(local.m864["conf_mod_ts_backup"], null)
  connection_status = try(local.m864["connection_status"], null)
  create_time = try(local.m864["create_time"], null)
  default_domain = try(local.m864["default_domain"], null)
  device_mo_id = try(local.m864["device_mo_id"], null)
  dn = try(local.m864["dn"], null)
  domain_group_moid = try(local.m864["domain_group_moid"], null)
  ethernet_mode = try(local.m864["ethernet_mode"], null)
  ethernet_switching_mode = try(local.m864["ethernet_switching_mode"], null)
  fault_summary = try(local.m864["fault_summary"], null)
  fc_mode = try(local.m864["fc_mode"], null)
  fc_switching_mode = try(local.m864["fc_switching_mode"], null)
  firmware = try(local.m864["firmware"], null)
  firmware_version = try(local.m864["firmware_version"], null)
  fpga_upgrade_needed = try(local.m864["fpga_upgrade_needed"], null)
  id = try(local.m864["id"], null)
  inband_ip_address = try(local.m864["inband_ip_address"], null)
  inband_ip_gateway = try(local.m864["inband_ip_gateway"], null)
  inband_ip_mask = try(local.m864["inband_ip_mask"], null)
  inband_ipv6_address = try(local.m864["inband_ipv6_address"], null)
  inband_ipv6_gateway = try(local.m864["inband_ipv6_gateway"], null)
  inband_ipv6_prefix = try(local.m864["inband_ipv6_prefix"], null)
  inband_mac = try(local.m864["inband_mac"], null)
  inband_vlan = try(local.m864["inband_vlan"], null)
  inter_cluster_link_state = try(local.m864["inter_cluster_link_state"], null)
  ipv4_address = try(local.m864["ipv4_address"], null)
  is_upgraded = try(local.m864["is_upgraded"], null)
  jumbo_frame_enabled = try(local.m864["jumbo_frame_enabled"], null)
  lldp_enabled = try(local.m864["lldp_enabled"], null)
  management_mode = try(local.m864["management_mode"], null)
  mod_time = try(local.m864["mod_time"], null)
  model = try(local.m864["model"], null)
  moid = try(local.m864["moid"], null)
  name = try(local.m864["name"], null)
  nr_version = try(local.m864["nr_version"], null)
  num_ether_ports = try(local.m864["num_ether_ports"], null)
  num_ether_ports_configured = try(local.m864["num_ether_ports_configured"], null)
  num_ether_ports_link_up = try(local.m864["num_ether_ports_link_up"], null)
  num_expansion_modules = try(local.m864["num_expansion_modules"], null)
  num_fc_ports = try(local.m864["num_fc_ports"], null)
  num_fc_ports_configured = try(local.m864["num_fc_ports_configured"], null)
  num_fc_ports_link_up = try(local.m864["num_fc_ports_link_up"], null)
  object_type = try(local.m864["object_type"], null)
  oper_evac_state = try(local.m864["oper_evac_state"], null)
  operability = try(local.m864["operability"], null)
  out_of_band_ip_address = try(local.m864["out_of_band_ip_address"], null)
  out_of_band_ip_gateway = try(local.m864["out_of_band_ip_gateway"], null)
  out_of_band_ip_mask = try(local.m864["out_of_band_ip_mask"], null)
  out_of_band_ipv4_address = try(local.m864["out_of_band_ipv4_address"], null)
  out_of_band_ipv4_gateway = try(local.m864["out_of_band_ipv4_gateway"], null)
  out_of_band_ipv4_mask = try(local.m864["out_of_band_ipv4_mask"], null)
  out_of_band_ipv6_address = try(local.m864["out_of_band_ipv6_address"], null)
  out_of_band_ipv6_error = try(local.m864["out_of_band_ipv6_error"], null)
  out_of_band_ipv6_gateway = try(local.m864["out_of_band_ipv6_gateway"], null)
  out_of_band_ipv6_mode = try(local.m864["out_of_band_ipv6_mode"], null)
  out_of_band_ipv6_prefix = try(local.m864["out_of_band_ipv6_prefix"], null)
  out_of_band_ipv6_redirects = try(local.m864["out_of_band_ipv6_redirects"], null)
  out_of_band_ipv6_slaac_iid_mode = try(local.m864["out_of_band_ipv6_slaac_iid_mode"], null)
  out_of_band_ipv6_status = try(local.m864["out_of_band_ipv6_status"], null)
  out_of_band_mac = try(local.m864["out_of_band_mac"], null)
  owners = try(local.m864["owners"], null)
  part_number = try(local.m864["part_number"], null)
  peer_firmware_out_of_sync = try(local.m864["peer_firmware_out_of_sync"], null)
  presence = try(local.m864["presence"], null)
  reserved_vlan_start_id = try(local.m864["reserved_vlan_start_id"], null)
  results = try(local.m864["results"], null)
  revision = try(local.m864["revision"], null)
  rn = try(local.m864["rn"], null)
  router_mac = try(local.m864["router_mac"], null)
  serial = try(local.m864["serial"], null)
  shared_scope = try(local.m864["shared_scope"], null)
  slot_id = try(local.m864["slot_id"], null)
  source_object_type = try(local.m864["source_object_type"], null)
  status = try(local.m864["status"], null)
  stp_mode = try(local.m864["stp_mode"], null)
  switch_id = try(local.m864["switch_id"], null)
  switch_profile_name = try(local.m864["switch_profile_name"], null)
  switch_type = try(local.m864["switch_type"], null)
  switch_wwn = try(local.m864["switch_wwn"], null)
  system_up_time = try(local.m864["system_up_time"], null)
  thermal = try(local.m864["thermal"], null)
  total_memory = try(local.m864["total_memory"], null)
  user_label = try(local.m864["user_label"], null)
  vendor = try(local.m864["vendor"], null)
  dynamic "alarm_summary" {
    for_each = try(local.m864["alarm_summary"], null) == null ? [] : local.m864["alarm_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m864["ancestors"], null) == null ? [] : local.m864["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m864["equipment_chassis"], null) == null ? [] : local.m864["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_parent" {
    for_each = try(local.m864["inventory_parent"], null) == null ? [] : local.m864["inventory_parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "location_details" {
    for_each = try(local.m864["location_details"], null) == null ? [] : local.m864["location_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m864["parent"], null) == null ? [] : local.m864["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m864["permission_resources"], null) == null ? [] : local.m864["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m864["registered_device"], null) == null ? [] : local.m864["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "secure_router_info" {
    for_each = try(local.m864["secure_router_info"], null) == null ? [] : local.m864["secure_router_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m864["tags"], null) == null ? [] : local.m864["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m864["version_context"], null) == null ? [] : local.m864["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
