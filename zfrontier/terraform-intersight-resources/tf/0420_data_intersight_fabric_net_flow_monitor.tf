# Sample data source intersight_fabric_net_flow_monitor — reads ../models/data_intersight_fabric_net_flow_monitor.yml
locals { m420 = yamldecode(file("${path.module}/../models/data_intersight_fabric_net_flow_monitor.yml"))["data_intersight_fabric_net_flow_monitor"] }

data "intersight_fabric_net_flow_monitor" "n420" {
  account_moid = try(local.m420["account_moid"], null)
  additional_properties = try(local.m420["additional_properties"], null)
  class_id = try(local.m420["class_id"], null)
  create_time = try(local.m420["create_time"], null)
  domain_group_moid = try(local.m420["domain_group_moid"], null)
  id = try(local.m420["id"], null)
  mod_time = try(local.m420["mod_time"], null)
  moid = try(local.m420["moid"], null)
  name = try(local.m420["name"], null)
  object_type = try(local.m420["object_type"], null)
  owners = try(local.m420["owners"], null)
  results = try(local.m420["results"], null)
  shared_scope = try(local.m420["shared_scope"], null)
  vnic_usage_count = try(local.m420["vnic_usage_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m420["ancestors"], null) == null ? [] : local.m420["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "flow_exporters" {
    for_each = try(local.m420["flow_exporters"], null) == null ? [] : local.m420["flow_exporters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "flow_record" {
    for_each = try(local.m420["flow_record"], null) == null ? [] : local.m420["flow_record"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "net_flow_policy" {
    for_each = try(local.m420["net_flow_policy"], null) == null ? [] : local.m420["net_flow_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m420["parent"], null) == null ? [] : local.m420["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m420["permission_resources"], null) == null ? [] : local.m420["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m420["tags"], null) == null ? [] : local.m420["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m420["version_context"], null) == null ? [] : local.m420["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
