# Sample data source intersight_storage_net_app_volume — reads ../models/data_intersight_storage_net_app_volume.yml
locals { m1305 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_volume.yml"))["data_intersight_storage_net_app_volume"] }

data "intersight_storage_net_app_volume" "n1305" {
  account_moid = try(local.m1305["account_moid"], null)
  additional_properties = try(local.m1305["additional_properties"], null)
  autosize_mode = try(local.m1305["autosize_mode"], null)
  class_id = try(local.m1305["class_id"], null)
  create_time = try(local.m1305["create_time"], null)
  created_time = try(local.m1305["created_time"], null)
  domain_group_moid = try(local.m1305["domain_group_moid"], null)
  export_policy_name = try(local.m1305["export_policy_name"], null)
  flex_cache_endpoint_type = try(local.m1305["flex_cache_endpoint_type"], null)
  id = try(local.m1305["id"], null)
  is_object_store = try(local.m1305["is_object_store"], null)
  key = try(var.secrets["data_intersight_storage_net_app_volume.key"], local.m1305["key"])
  mod_time = try(local.m1305["mod_time"], null)
  moid = try(local.m1305["moid"], null)
  name = try(local.m1305["name"], null)
  object_type = try(local.m1305["object_type"], null)
  owners = try(local.m1305["owners"], null)
  results = try(local.m1305["results"], null)
  shared_scope = try(local.m1305["shared_scope"], null)
  snapshot_autodelete_enabled = try(local.m1305["snapshot_autodelete_enabled"], null)
  snapshot_policy_name = try(local.m1305["snapshot_policy_name"], null)
  snapshot_policy_uuid = try(local.m1305["snapshot_policy_uuid"], null)
  snapshot_reserve_percent = try(local.m1305["snapshot_reserve_percent"], null)
  snapshot_used = try(local.m1305["snapshot_used"], null)
  state = try(local.m1305["state"], null)
  style = try(local.m1305["style"], null)
  svm_name = try(local.m1305["svm_name"], null)
  type = try(local.m1305["type"], null)
  uuid = try(local.m1305["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1305["ancestors"], null) == null ? [] : local.m1305["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1305["array"], null) == null ? [] : local.m1305["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "avg_performance_metrics" {
    for_each = try(local.m1305["avg_performance_metrics"], null) == null ? [] : local.m1305["avg_performance_metrics"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disk_pool" {
    for_each = try(local.m1305["disk_pool"], null) == null ? [] : local.m1305["disk_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "events" {
    for_each = try(local.m1305["events"], null) == null ? [] : local.m1305["events"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1305["parent"], null) == null ? [] : local.m1305["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1305["permission_resources"], null) == null ? [] : local.m1305["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1305["storage_utilization"], null) == null ? [] : local.m1305["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1305["tags"], null) == null ? [] : local.m1305["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1305["tenant"], null) == null ? [] : local.m1305["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1305["version_context"], null) == null ? [] : local.m1305["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
