# Sample data source intersight_capability_switch_capability — reads ../models/data_intersight_capability_switch_capability.yml
locals { m189 = yamldecode(file("${path.module}/../models/data_intersight_capability_switch_capability.yml"))["data_intersight_capability_switch_capability"] }

data "intersight_capability_switch_capability" "n189" {
  account_moid = try(local.m189["account_moid"], null)
  additional_properties = try(local.m189["additional_properties"], null)
  class_id = try(local.m189["class_id"], null)
  create_time = try(local.m189["create_time"], null)
  default_fcoe_vlan = try(local.m189["default_fcoe_vlan"], null)
  domain_group_moid = try(local.m189["domain_group_moid"], null)
  dynamic_vifs_supported = try(local.m189["dynamic_vifs_supported"], null)
  fan_modules_supported = try(local.m189["fan_modules_supported"], null)
  fc_uplink_ports_auto_negotiation_supported = try(local.m189["fc_uplink_ports_auto_negotiation_supported"], null)
  id = try(local.m189["id"], null)
  imm_controls_vpcompression = try(local.m189["imm_controls_vpcompression"], null)
  intra_chassis_vlan_supported = try(local.m189["intra_chassis_vlan_supported"], null)
  locator_beacon_supported = try(local.m189["locator_beacon_supported"], null)
  max_ports = try(local.m189["max_ports"], null)
  max_slots = try(local.m189["max_slots"], null)
  mod_time = try(local.m189["mod_time"], null)
  moid = try(local.m189["moid"], null)
  name = try(local.m189["name"], null)
  object_type = try(local.m189["object_type"], null)
  owners = try(local.m189["owners"], null)
  pid = try(local.m189["pid"], null)
  results = try(local.m189["results"], null)
  sereno_netflow_supported = try(local.m189["sereno_netflow_supported"], null)
  server_role_supported_on_breakout = try(local.m189["server_role_supported_on_breakout"], null)
  shared_scope = try(local.m189["shared_scope"], null)
  sku = try(local.m189["sku"], null)
  un_supported_equipment_model = try(local.m189["un_supported_equipment_model"], null)
  unified_rule = try(local.m189["unified_rule"], null)
  uplink_admin_port_speed_neg_auto25_gbps_supported = try(local.m189["uplink_admin_port_speed_neg_auto25_gbps_supported"], null)
  vid = try(local.m189["vid"], null)
  dynamic "allowed_uplink_pc_id_range" {
    for_each = try(local.m189["allowed_uplink_pc_id_range"], null) == null ? [] : local.m189["allowed_uplink_pc_id_range"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m189["ancestors"], null) == null ? [] : local.m189["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_end_host_mode_reserved_vsans" {
    for_each = try(local.m189["fc_end_host_mode_reserved_vsans"], null) == null ? [] : local.m189["fc_end_host_mode_reserved_vsans"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "macsec_supported_ports" {
    for_each = try(local.m189["macsec_supported_ports"], null) == null ? [] : local.m189["macsec_supported_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "min_version_map_for_switch_features" {
    for_each = try(local.m189["min_version_map_for_switch_features"], null) == null ? [] : local.m189["min_version_map_for_switch_features"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "min_version_map_with_breakout_support" {
    for_each = try(local.m189["min_version_map_with_breakout_support"], null) == null ? [] : local.m189["min_version_map_with_breakout_support"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "min_version_map_with_locator_led_support" {
    for_each = try(local.m189["min_version_map_with_locator_led_support"], null) == null ? [] : local.m189["min_version_map_with_locator_led_support"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "min_version_map_with_neg_auto25g_support" {
    for_each = try(local.m189["min_version_map_with_neg_auto25g_support"], null) == null ? [] : local.m189["min_version_map_with_neg_auto25g_support"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_limits" {
    for_each = try(local.m189["network_limits"], null) == null ? [] : local.m189["network_limits"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m189["parent"], null) == null ? [] : local.m189["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m189["permission_resources"], null) == null ? [] : local.m189["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports_supporting100g_speed" {
    for_each = try(local.m189["ports_supporting100g_speed"], null) == null ? [] : local.m189["ports_supporting100g_speed"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports_supporting10g_speed" {
    for_each = try(local.m189["ports_supporting10g_speed"], null) == null ? [] : local.m189["ports_supporting10g_speed"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports_supporting1g_speed" {
    for_each = try(local.m189["ports_supporting1g_speed"], null) == null ? [] : local.m189["ports_supporting1g_speed"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports_supporting25g_speed" {
    for_each = try(local.m189["ports_supporting25g_speed"], null) == null ? [] : local.m189["ports_supporting25g_speed"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports_supporting400g_speed" {
    for_each = try(local.m189["ports_supporting400g_speed"], null) == null ? [] : local.m189["ports_supporting400g_speed"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports_supporting40g_speed" {
    for_each = try(local.m189["ports_supporting40g_speed"], null) == null ? [] : local.m189["ports_supporting40g_speed"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports_supporting50g_speed" {
    for_each = try(local.m189["ports_supporting50g_speed"], null) == null ? [] : local.m189["ports_supporting50g_speed"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports_supporting_appliance_role" {
    for_each = try(local.m189["ports_supporting_appliance_role"], null) == null ? [] : local.m189["ports_supporting_appliance_role"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports_supporting_breakout" {
    for_each = try(local.m189["ports_supporting_breakout"], null) == null ? [] : local.m189["ports_supporting_breakout"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports_supporting_fcoe" {
    for_each = try(local.m189["ports_supporting_fcoe"], null) == null ? [] : local.m189["ports_supporting_fcoe"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports_supporting_intra_chassis_vlans" {
    for_each = try(local.m189["ports_supporting_intra_chassis_vlans"], null) == null ? [] : local.m189["ports_supporting_intra_chassis_vlans"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports_supporting_server_role" {
    for_each = try(local.m189["ports_supporting_server_role"], null) == null ? [] : local.m189["ports_supporting_server_role"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reserved_vsans" {
    for_each = try(local.m189["reserved_vsans"], null) == null ? [] : local.m189["reserved_vsans"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_limits" {
    for_each = try(local.m189["storage_limits"], null) == null ? [] : local.m189["storage_limits"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "switching_mode_capabilities" {
    for_each = try(local.m189["switching_mode_capabilities"], null) == null ? [] : local.m189["switching_mode_capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system_limits" {
    for_each = try(local.m189["system_limits"], null) == null ? [] : local.m189["system_limits"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m189["tags"], null) == null ? [] : local.m189["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "unified_ports" {
    for_each = try(local.m189["unified_ports"], null) == null ? [] : local.m189["unified_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m189["version_context"], null) == null ? [] : local.m189["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
