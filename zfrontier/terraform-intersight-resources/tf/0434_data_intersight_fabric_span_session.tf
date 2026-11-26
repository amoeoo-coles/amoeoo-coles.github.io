# Sample data source intersight_fabric_span_session — reads ../models/data_intersight_fabric_span_session.yml
locals { m434 = yamldecode(file("${path.module}/../models/data_intersight_fabric_span_session.yml"))["data_intersight_fabric_span_session"] }

data "intersight_fabric_span_session" "n434" {
  account_moid = try(local.m434["account_moid"], null)
  additional_properties = try(local.m434["additional_properties"], null)
  admin_state = try(local.m434["admin_state"], null)
  class_id = try(local.m434["class_id"], null)
  config_state = try(local.m434["config_state"], null)
  create_time = try(local.m434["create_time"], null)
  domain_group_moid = try(local.m434["domain_group_moid"], null)
  id = try(local.m434["id"], null)
  mod_time = try(local.m434["mod_time"], null)
  moid = try(local.m434["moid"], null)
  name = try(local.m434["name"], null)
  object_type = try(local.m434["object_type"], null)
  oper_state = try(local.m434["oper_state"], null)
  oper_state_reason = try(local.m434["oper_state_reason"], null)
  owners = try(local.m434["owners"], null)
  results = try(local.m434["results"], null)
  session_id = try(local.m434["session_id"], null)
  session_type = try(local.m434["session_type"], null)
  shared_scope = try(local.m434["shared_scope"], null)
  source_count = try(local.m434["source_count"], null)
  span_control_packets = try(local.m434["span_control_packets"], null)
  switch_id = try(local.m434["switch_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m434["ancestors"], null) == null ? [] : local.m434["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "dest_ports" {
    for_each = try(local.m434["dest_ports"], null) == null ? [] : local.m434["dest_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "dest_remotes" {
    for_each = try(local.m434["dest_remotes"], null) == null ? [] : local.m434["dest_remotes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m434["network_element"], null) == null ? [] : local.m434["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m434["parent"], null) == null ? [] : local.m434["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m434["permission_resources"], null) == null ? [] : local.m434["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "source_port_channels" {
    for_each = try(local.m434["source_port_channels"], null) == null ? [] : local.m434["source_port_channels"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "source_ports" {
    for_each = try(local.m434["source_ports"], null) == null ? [] : local.m434["source_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "source_virtual_ifs" {
    for_each = try(local.m434["source_virtual_ifs"], null) == null ? [] : local.m434["source_virtual_ifs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "source_vlans" {
    for_each = try(local.m434["source_vlans"], null) == null ? [] : local.m434["source_vlans"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m434["tags"], null) == null ? [] : local.m434["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m434["version_context"], null) == null ? [] : local.m434["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
