# Sample data source intersight_storage_net_app_aggregate — reads ../models/data_intersight_storage_net_app_aggregate.yml
locals { m1260 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_aggregate.yml"))["data_intersight_storage_net_app_aggregate"] }

data "intersight_storage_net_app_aggregate" "n1260" {
  account_moid = try(local.m1260["account_moid"], null)
  additional_properties = try(local.m1260["additional_properties"], null)
  aggregate_type = try(local.m1260["aggregate_type"], null)
  class_id = try(local.m1260["class_id"], null)
  cloud_storage = try(local.m1260["cloud_storage"], null)
  create_time = try(local.m1260["create_time"], null)
  domain_group_moid = try(local.m1260["domain_group_moid"], null)
  efficiency_ratio = try(local.m1260["efficiency_ratio"], null)
  id = try(local.m1260["id"], null)
  key = try(var.secrets["data_intersight_storage_net_app_aggregate.key"], local.m1260["key"])
  mod_time = try(local.m1260["mod_time"], null)
  moid = try(local.m1260["moid"], null)
  name = try(local.m1260["name"], null)
  node_name = try(local.m1260["node_name"], null)
  object_type = try(local.m1260["object_type"], null)
  owners = try(local.m1260["owners"], null)
  pool_id = try(local.m1260["pool_id"], null)
  raid_size = try(local.m1260["raid_size"], null)
  raid_type = try(local.m1260["raid_type"], null)
  results = try(local.m1260["results"], null)
  shared_scope = try(local.m1260["shared_scope"], null)
  state = try(local.m1260["state"], null)
  status = try(local.m1260["status"], null)
  type = try(local.m1260["type"], null)
  uuid = try(local.m1260["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1260["ancestors"], null) == null ? [] : local.m1260["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array_controller" {
    for_each = try(local.m1260["array_controller"], null) == null ? [] : local.m1260["array_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "avg_performance_metrics" {
    for_each = try(local.m1260["avg_performance_metrics"], null) == null ? [] : local.m1260["avg_performance_metrics"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "events" {
    for_each = try(local.m1260["events"], null) == null ? [] : local.m1260["events"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1260["parent"], null) == null ? [] : local.m1260["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1260["permission_resources"], null) == null ? [] : local.m1260["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1260["storage_utilization"], null) == null ? [] : local.m1260["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1260["tags"], null) == null ? [] : local.m1260["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1260["version_context"], null) == null ? [] : local.m1260["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
