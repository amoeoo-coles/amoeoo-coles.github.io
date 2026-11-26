# Sample data source intersight_fabric_span_source_eth_port — reads ../models/data_intersight_fabric_span_source_eth_port.yml
locals { m435 = yamldecode(file("${path.module}/../models/data_intersight_fabric_span_source_eth_port.yml"))["data_intersight_fabric_span_source_eth_port"] }

data "intersight_fabric_span_source_eth_port" "n435" {
  account_moid = try(local.m435["account_moid"], null)
  additional_properties = try(local.m435["additional_properties"], null)
  aggregate_port_id = try(local.m435["aggregate_port_id"], null)
  class_id = try(local.m435["class_id"], null)
  create_time = try(local.m435["create_time"], null)
  direction = try(local.m435["direction"], null)
  domain_group_moid = try(local.m435["domain_group_moid"], null)
  id = try(local.m435["id"], null)
  mod_time = try(local.m435["mod_time"], null)
  moid = try(local.m435["moid"], null)
  object_type = try(local.m435["object_type"], null)
  owners = try(local.m435["owners"], null)
  port_id = try(local.m435["port_id"], null)
  results = try(local.m435["results"], null)
  shared_scope = try(local.m435["shared_scope"], null)
  slot_id = try(local.m435["slot_id"], null)
  source_role = try(local.m435["source_role"], null)
  dynamic "ancestors" {
    for_each = try(local.m435["ancestors"], null) == null ? [] : local.m435["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m435["parent"], null) == null ? [] : local.m435["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m435["permission_resources"], null) == null ? [] : local.m435["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_port" {
    for_each = try(local.m435["physical_port"], null) == null ? [] : local.m435["physical_port"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "span_session" {
    for_each = try(local.m435["span_session"], null) == null ? [] : local.m435["span_session"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m435["tags"], null) == null ? [] : local.m435["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m435["version_context"], null) == null ? [] : local.m435["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
