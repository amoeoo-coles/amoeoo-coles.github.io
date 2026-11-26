# Sample data source intersight_fabric_span_source_eth_port_channel — reads ../models/data_intersight_fabric_span_source_eth_port_channel.yml
locals { m436 = yamldecode(file("${path.module}/../models/data_intersight_fabric_span_source_eth_port_channel.yml"))["data_intersight_fabric_span_source_eth_port_channel"] }

data "intersight_fabric_span_source_eth_port_channel" "n436" {
  account_moid = try(local.m436["account_moid"], null)
  additional_properties = try(local.m436["additional_properties"], null)
  class_id = try(local.m436["class_id"], null)
  create_time = try(local.m436["create_time"], null)
  direction = try(local.m436["direction"], null)
  domain_group_moid = try(local.m436["domain_group_moid"], null)
  id = try(local.m436["id"], null)
  mod_time = try(local.m436["mod_time"], null)
  moid = try(local.m436["moid"], null)
  object_type = try(local.m436["object_type"], null)
  owners = try(local.m436["owners"], null)
  pc_id = try(local.m436["pc_id"], null)
  results = try(local.m436["results"], null)
  shared_scope = try(local.m436["shared_scope"], null)
  source_role = try(local.m436["source_role"], null)
  dynamic "ancestors" {
    for_each = try(local.m436["ancestors"], null) == null ? [] : local.m436["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m436["parent"], null) == null ? [] : local.m436["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m436["permission_resources"], null) == null ? [] : local.m436["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_port_channel" {
    for_each = try(local.m436["physical_port_channel"], null) == null ? [] : local.m436["physical_port_channel"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "span_session" {
    for_each = try(local.m436["span_session"], null) == null ? [] : local.m436["span_session"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m436["tags"], null) == null ? [] : local.m436["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m436["version_context"], null) == null ? [] : local.m436["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
