# Sample data source intersight_fabric_switch_control_policy — reads ../models/data_intersight_fabric_switch_control_policy.yml
locals { m441 = yamldecode(file("${path.module}/../models/data_intersight_fabric_switch_control_policy.yml"))["data_intersight_fabric_switch_control_policy"] }

data "intersight_fabric_switch_control_policy" "n441" {
  account_moid = try(local.m441["account_moid"], null)
  additional_properties = try(local.m441["additional_properties"], null)
  aes_primary_key = try(var.secrets["data_intersight_fabric_switch_control_policy.aes_primary_key"], local.m441["aes_primary_key"])
  class_id = try(local.m441["class_id"], null)
  create_time = try(local.m441["create_time"], null)
  description = try(local.m441["description"], null)
  domain_group_moid = try(local.m441["domain_group_moid"], null)
  enable_jumbo_frame = try(local.m441["enable_jumbo_frame"], null)
  ethernet_switching_mode = try(local.m441["ethernet_switching_mode"], null)
  fabric_pc_vhba_reset = try(local.m441["fabric_pc_vhba_reset"], null)
  fc_switching_mode = try(local.m441["fc_switching_mode"], null)
  id = try(local.m441["id"], null)
  is_aes_primary_key_set = try(local.m441["is_aes_primary_key_set"], null)
  mod_time = try(local.m441["mod_time"], null)
  moid = try(local.m441["moid"], null)
  name = try(local.m441["name"], null)
  object_type = try(local.m441["object_type"], null)
  owners = try(local.m441["owners"], null)
  reserved_vlan_start_id = try(local.m441["reserved_vlan_start_id"], null)
  results = try(local.m441["results"], null)
  shared_scope = try(local.m441["shared_scope"], null)
  target_platform = try(local.m441["target_platform"], null)
  vlan_port_optimization_enabled = try(local.m441["vlan_port_optimization_enabled"], null)
  dynamic "ancestors" {
    for_each = try(local.m441["ancestors"], null) == null ? [] : local.m441["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "lldp_settings" {
    for_each = try(local.m441["lldp_settings"], null) == null ? [] : local.m441["lldp_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mac_aging_settings" {
    for_each = try(local.m441["mac_aging_settings"], null) == null ? [] : local.m441["mac_aging_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mac_learning_settings" {
    for_each = try(local.m441["mac_learning_settings"], null) == null ? [] : local.m441["mac_learning_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m441["organization"], null) == null ? [] : local.m441["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m441["parent"], null) == null ? [] : local.m441["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m441["permission_resources"], null) == null ? [] : local.m441["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m441["profiles"], null) == null ? [] : local.m441["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "stp_settings" {
    for_each = try(local.m441["stp_settings"], null) == null ? [] : local.m441["stp_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m441["tags"], null) == null ? [] : local.m441["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "udld_settings" {
    for_each = try(local.m441["udld_settings"], null) == null ? [] : local.m441["udld_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m441["version_context"], null) == null ? [] : local.m441["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
