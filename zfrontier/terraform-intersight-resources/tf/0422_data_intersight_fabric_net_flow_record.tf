# Sample data source intersight_fabric_net_flow_record — reads ../models/data_intersight_fabric_net_flow_record.yml
locals { m422 = yamldecode(file("${path.module}/../models/data_intersight_fabric_net_flow_record.yml"))["data_intersight_fabric_net_flow_record"] }

data "intersight_fabric_net_flow_record" "n422" {
  account_moid = try(local.m422["account_moid"], null)
  additional_properties = try(local.m422["additional_properties"], null)
  class_id = try(local.m422["class_id"], null)
  create_time = try(local.m422["create_time"], null)
  domain_group_moid = try(local.m422["domain_group_moid"], null)
  id = try(local.m422["id"], null)
  mod_time = try(local.m422["mod_time"], null)
  moid = try(local.m422["moid"], null)
  name = try(local.m422["name"], null)
  object_type = try(local.m422["object_type"], null)
  owners = try(local.m422["owners"], null)
  record_type = try(local.m422["record_type"], null)
  results = try(local.m422["results"], null)
  shared_scope = try(local.m422["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m422["ancestors"], null) == null ? [] : local.m422["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "flow_non_key" {
    for_each = try(local.m422["flow_non_key"], null) == null ? [] : local.m422["flow_non_key"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ipv4_flow_key" {
    for_each = try(local.m422["ipv4_flow_key"], null) == null ? [] : local.m422["ipv4_flow_key"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ipv6_flow_key" {
    for_each = try(local.m422["ipv6_flow_key"], null) == null ? [] : local.m422["ipv6_flow_key"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "l2_flow_key" {
    for_each = try(local.m422["l2_flow_key"], null) == null ? [] : local.m422["l2_flow_key"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "net_flow_policy" {
    for_each = try(local.m422["net_flow_policy"], null) == null ? [] : local.m422["net_flow_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "netflow_monitors" {
    for_each = try(local.m422["netflow_monitors"], null) == null ? [] : local.m422["netflow_monitors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m422["parent"], null) == null ? [] : local.m422["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m422["permission_resources"], null) == null ? [] : local.m422["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m422["tags"], null) == null ? [] : local.m422["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m422["version_context"], null) == null ? [] : local.m422["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
