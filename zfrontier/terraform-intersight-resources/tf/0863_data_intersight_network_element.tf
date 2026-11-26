# Sample data source intersight_network_element — reads ../models/data_intersight_network_element.yml
locals { m863 = yamldecode(file("${path.module}/../models/data_intersight_network_element.yml"))["data_intersight_network_element"] }

data "intersight_network_element" "n863" {
  account_moid = try(local.m863["account_moid"], null)
  additional_properties = try(local.m863["additional_properties"], null)
  admin_evac_state = try(local.m863["admin_evac_state"], null)
  admin_inband_interface_state = try(local.m863["admin_inband_interface_state"], null)
  available_memory = try(local.m863["available_memory"], null)
  cdp_enabled = try(local.m863["cdp_enabled"], null)
  chassis = try(local.m863["chassis"], null)
  class_id = try(local.m863["class_id"], null)
  conf_mod_ts = try(local.m863["conf_mod_ts"], null)
  conf_mod_ts_backup = try(local.m863["conf_mod_ts_backup"], null)
  config_restore_state = try(local.m863["config_restore_state"], null)
  connection_status = try(local.m863["connection_status"], null)
  create_time = try(local.m863["create_time"], null)
  default_domain = try(local.m863["default_domain"], null)
  device_mo_id = try(local.m863["device_mo_id"], null)
  dn = try(local.m863["dn"], null)
  domain_group_moid = try(local.m863["domain_group_moid"], null)
  ethernet_mode = try(local.m863["ethernet_mode"], null)
  ethernet_switching_mode = try(local.m863["ethernet_switching_mode"], null)
  fault_summary = try(local.m863["fault_summary"], null)
  fc_mode = try(local.m863["fc_mode"], null)
  fc_switching_mode = try(local.m863["fc_switching_mode"], null)
  fpga_upgrade_needed = try(local.m863["fpga_upgrade_needed"], null)
  id = try(local.m863["id"], null)
  inband_ip_address = try(local.m863["inband_ip_address"], null)
  inband_ip_gateway = try(local.m863["inband_ip_gateway"], null)
  inband_ip_mask = try(local.m863["inband_ip_mask"], null)
  inband_ipv6_address = try(local.m863["inband_ipv6_address"], null)
  inband_ipv6_gateway = try(local.m863["inband_ipv6_gateway"], null)
  inband_ipv6_prefix = try(local.m863["inband_ipv6_prefix"], null)
  inband_mac = try(local.m863["inband_mac"], null)
  inband_vlan = try(local.m863["inband_vlan"], null)
  inter_cluster_link_state = try(local.m863["inter_cluster_link_state"], null)
  is_upgraded = try(local.m863["is_upgraded"], null)
  jumbo_frame_enabled = try(local.m863["jumbo_frame_enabled"], null)
  lldp_enabled = try(local.m863["lldp_enabled"], null)
  management_mode = try(local.m863["management_mode"], null)
  mod_time = try(local.m863["mod_time"], null)
  model = try(local.m863["model"], null)
  moid = try(local.m863["moid"], null)
  nr_version = try(local.m863["nr_version"], null)
  object_type = try(local.m863["object_type"], null)
  oper_evac_state = try(local.m863["oper_evac_state"], null)
  operability = try(local.m863["operability"], null)
  out_of_band_ip_address = try(local.m863["out_of_band_ip_address"], null)
  out_of_band_ip_gateway = try(local.m863["out_of_band_ip_gateway"], null)
  out_of_band_ip_mask = try(local.m863["out_of_band_ip_mask"], null)
  out_of_band_ipv4_address = try(local.m863["out_of_band_ipv4_address"], null)
  out_of_band_ipv4_gateway = try(local.m863["out_of_band_ipv4_gateway"], null)
  out_of_band_ipv4_mask = try(local.m863["out_of_band_ipv4_mask"], null)
  out_of_band_ipv4_mode = try(local.m863["out_of_band_ipv4_mode"], null)
  out_of_band_ipv6_address = try(local.m863["out_of_band_ipv6_address"], null)
  out_of_band_ipv6_error = try(local.m863["out_of_band_ipv6_error"], null)
  out_of_band_ipv6_gateway = try(local.m863["out_of_band_ipv6_gateway"], null)
  out_of_band_ipv6_mode = try(local.m863["out_of_band_ipv6_mode"], null)
  out_of_band_ipv6_prefix = try(local.m863["out_of_band_ipv6_prefix"], null)
  out_of_band_ipv6_redirects = try(local.m863["out_of_band_ipv6_redirects"], null)
  out_of_band_ipv6_slaac_iid_mode = try(local.m863["out_of_band_ipv6_slaac_iid_mode"], null)
  out_of_band_ipv6_status = try(local.m863["out_of_band_ipv6_status"], null)
  out_of_band_mac = try(local.m863["out_of_band_mac"], null)
  owners = try(local.m863["owners"], null)
  part_number = try(local.m863["part_number"], null)
  peer_firmware_out_of_sync = try(local.m863["peer_firmware_out_of_sync"], null)
  peer_interface_compatibility_issue_count = try(local.m863["peer_interface_compatibility_issue_count"], null)
  presence = try(local.m863["presence"], null)
  reserved_vlan_start_id = try(local.m863["reserved_vlan_start_id"], null)
  results = try(local.m863["results"], null)
  revision = try(local.m863["revision"], null)
  rn = try(local.m863["rn"], null)
  router_mac = try(local.m863["router_mac"], null)
  serial = try(local.m863["serial"], null)
  shared_scope = try(local.m863["shared_scope"], null)
  slot_id = try(local.m863["slot_id"], null)
  status = try(local.m863["status"], null)
  stp_mode = try(local.m863["stp_mode"], null)
  switch_id = try(local.m863["switch_id"], null)
  switch_profile_name = try(local.m863["switch_profile_name"], null)
  switch_type = try(local.m863["switch_type"], null)
  switch_wwn = try(local.m863["switch_wwn"], null)
  system_up_time = try(local.m863["system_up_time"], null)
  thermal = try(local.m863["thermal"], null)
  total_memory = try(local.m863["total_memory"], null)
  user_label = try(local.m863["user_label"], null)
  vendor = try(local.m863["vendor"], null)
  dynamic "alarm_summary" {
    for_each = try(local.m863["alarm_summary"], null) == null ? [] : local.m863["alarm_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m863["ancestors"], null) == null ? [] : local.m863["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_location" {
    for_each = try(local.m863["assigned_location"], null) == null ? [] : local.m863["assigned_location"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cards" {
    for_each = try(local.m863["cards"], null) == null ? [] : local.m863["cards"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cdp_neighbor" {
    for_each = try(local.m863["cdp_neighbor"], null) == null ? [] : local.m863["cdp_neighbor"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "chassis_controller" {
    for_each = try(local.m863["chassis_controller"], null) == null ? [] : local.m863["chassis_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "console" {
    for_each = try(local.m863["console"], null) == null ? [] : local.m863["console"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "dns" {
    for_each = try(local.m863["dns"], null) == null ? [] : local.m863["dns"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m863["equipment_chassis"], null) == null ? [] : local.m863["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ether_port_channels" {
    for_each = try(local.m863["ether_port_channels"], null) == null ? [] : local.m863["ether_port_channels"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fanmodules" {
    for_each = try(local.m863["fanmodules"], null) == null ? [] : local.m863["fanmodules"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_port_channels" {
    for_each = try(local.m863["fc_port_channels"], null) == null ? [] : local.m863["fc_port_channels"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "feature_control" {
    for_each = try(local.m863["feature_control"], null) == null ? [] : local.m863["feature_control"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "interface_list" {
    for_each = try(local.m863["interface_list"], null) == null ? [] : local.m863["interface_list"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m863["inventory_device_info"], null) == null ? [] : local.m863["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_address_infos" {
    for_each = try(local.m863["ip_address_infos"], null) == null ? [] : local.m863["ip_address_infos"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "license_file" {
    for_each = try(local.m863["license_file"], null) == null ? [] : local.m863["license_file"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "lldp_neighbor" {
    for_each = try(local.m863["lldp_neighbor"], null) == null ? [] : local.m863["lldp_neighbor"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "location_details" {
    for_each = try(local.m863["location_details"], null) == null ? [] : local.m863["location_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "locator_led" {
    for_each = try(local.m863["locator_led"], null) == null ? [] : local.m863["locator_led"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "management_controller" {
    for_each = try(local.m863["management_controller"], null) == null ? [] : local.m863["management_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "management_entity" {
    for_each = try(local.m863["management_entity"], null) == null ? [] : local.m863["management_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_fc_zone_info" {
    for_each = try(local.m863["network_fc_zone_info"], null) == null ? [] : local.m863["network_fc_zone_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_vlan_port_info" {
    for_each = try(local.m863["network_vlan_port_info"], null) == null ? [] : local.m863["network_vlan_port_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ntp_server" {
    for_each = try(local.m863["ntp_server"], null) == null ? [] : local.m863["ntp_server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m863["parent"], null) == null ? [] : local.m863["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m863["permission_resources"], null) == null ? [] : local.m863["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_mac_bindings" {
    for_each = try(local.m863["port_mac_bindings"], null) == null ? [] : local.m863["port_mac_bindings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m863["previous_fru"], null) == null ? [] : local.m863["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "processor_unit" {
    for_each = try(local.m863["processor_unit"], null) == null ? [] : local.m863["processor_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "psus" {
    for_each = try(local.m863["psus"], null) == null ? [] : local.m863["psus"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m863["registered_device"], null) == null ? [] : local.m863["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "secure_router_info" {
    for_each = try(local.m863["secure_router_info"], null) == null ? [] : local.m863["secure_router_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sensors" {
    for_each = try(local.m863["sensors"], null) == null ? [] : local.m863["sensors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_items" {
    for_each = try(local.m863["storage_items"], null) == null ? [] : local.m863["storage_items"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "supervisor_card" {
    for_each = try(local.m863["supervisor_card"], null) == null ? [] : local.m863["supervisor_card"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m863["tags"], null) == null ? [] : local.m863["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "top_system" {
    for_each = try(local.m863["top_system"], null) == null ? [] : local.m863["top_system"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ucsm_running_firmware" {
    for_each = try(local.m863["ucsm_running_firmware"], null) == null ? [] : local.m863["ucsm_running_firmware"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m863["version_context"], null) == null ? [] : local.m863["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "veths" {
    for_each = try(local.m863["veths"], null) == null ? [] : local.m863["veths"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vfcs" {
    for_each = try(local.m863["vfcs"], null) == null ? [] : local.m863["vfcs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vpc_domain" {
    for_each = try(local.m863["vpc_domain"], null) == null ? [] : local.m863["vpc_domain"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vpc_member" {
    for_each = try(local.m863["vpc_member"], null) == null ? [] : local.m863["vpc_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vpc_peer" {
    for_each = try(local.m863["vpc_peer"], null) == null ? [] : local.m863["vpc_peer"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vrf" {
    for_each = try(local.m863["vrf"], null) == null ? [] : local.m863["vrf"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
