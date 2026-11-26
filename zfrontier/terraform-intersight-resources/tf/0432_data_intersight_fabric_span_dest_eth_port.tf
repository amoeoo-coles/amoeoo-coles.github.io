# Sample data source intersight_fabric_span_dest_eth_port — reads ../models/data_intersight_fabric_span_dest_eth_port.yml
locals { m432 = yamldecode(file("${path.module}/../models/data_intersight_fabric_span_dest_eth_port.yml"))["data_intersight_fabric_span_dest_eth_port"] }

data "intersight_fabric_span_dest_eth_port" "n432" {
  account_moid = try(local.m432["account_moid"], null)
  additional_properties = try(local.m432["additional_properties"], null)
  admin_speed = try(local.m432["admin_speed"], null)
  aggregate_port_id = try(local.m432["aggregate_port_id"], null)
  class_id = try(local.m432["class_id"], null)
  create_time = try(local.m432["create_time"], null)
  domain_group_moid = try(local.m432["domain_group_moid"], null)
  fec = try(local.m432["fec"], null)
  id = try(local.m432["id"], null)
  mod_time = try(local.m432["mod_time"], null)
  moid = try(local.m432["moid"], null)
  object_type = try(local.m432["object_type"], null)
  owners = try(local.m432["owners"], null)
  port_id = try(local.m432["port_id"], null)
  results = try(local.m432["results"], null)
  shared_scope = try(local.m432["shared_scope"], null)
  slot_id = try(local.m432["slot_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m432["ancestors"], null) == null ? [] : local.m432["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m432["parent"], null) == null ? [] : local.m432["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m432["permission_resources"], null) == null ? [] : local.m432["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_port" {
    for_each = try(local.m432["physical_port"], null) == null ? [] : local.m432["physical_port"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "span_session" {
    for_each = try(local.m432["span_session"], null) == null ? [] : local.m432["span_session"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m432["tags"], null) == null ? [] : local.m432["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m432["version_context"], null) == null ? [] : local.m432["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
