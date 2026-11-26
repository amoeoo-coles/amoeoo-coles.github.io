# Sample data source intersight_appliance_node_iops_metric — reads ../models/data_intersight_appliance_node_iops_metric.yml
locals { m069 = yamldecode(file("${path.module}/../models/data_intersight_appliance_node_iops_metric.yml"))["data_intersight_appliance_node_iops_metric"] }

data "intersight_appliance_node_iops_metric" "n069" {
  account_moid = try(local.m069["account_moid"], null)
  additional_properties = try(local.m069["additional_properties"], null)
  class_id = try(local.m069["class_id"], null)
  create_time = try(local.m069["create_time"], null)
  domain_group_moid = try(local.m069["domain_group_moid"], null)
  end_time = try(local.m069["end_time"], null)
  id = try(local.m069["id"], null)
  iops = try(local.m069["iops"], null)
  meta_field = try(local.m069["meta_field"], null)
  mod_time = try(local.m069["mod_time"], null)
  moid = try(local.m069["moid"], null)
  node_hostname = try(local.m069["node_hostname"], null)
  node_id = try(local.m069["node_id"], null)
  object_type = try(local.m069["object_type"], null)
  owners = try(local.m069["owners"], null)
  results = try(local.m069["results"], null)
  shared_scope = try(local.m069["shared_scope"], null)
  time = try(local.m069["time"], null)
  dynamic "ancestors" {
    for_each = try(local.m069["ancestors"], null) == null ? [] : local.m069["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "attributes" {
    for_each = try(local.m069["attributes"], null) == null ? [] : local.m069["attributes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m069["parent"], null) == null ? [] : local.m069["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m069["permission_resources"], null) == null ? [] : local.m069["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m069["tags"], null) == null ? [] : local.m069["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m069["version_context"], null) == null ? [] : local.m069["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
