# Sample data source intersight_storage_net_app_namespace — reads ../models/data_intersight_storage_net_app_namespace.yml
locals { m1288 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_namespace.yml"))["data_intersight_storage_net_app_namespace"] }

data "intersight_storage_net_app_namespace" "n1288" {
  account_moid = try(local.m1288["account_moid"], null)
  additional_properties = try(local.m1288["additional_properties"], null)
  class_id = try(local.m1288["class_id"], null)
  container_state = try(local.m1288["container_state"], null)
  create_time = try(local.m1288["create_time"], null)
  domain_group_moid = try(local.m1288["domain_group_moid"], null)
  id = try(local.m1288["id"], null)
  is_mapped = try(local.m1288["is_mapped"], null)
  mod_time = try(local.m1288["mod_time"], null)
  moid = try(local.m1288["moid"], null)
  name = try(local.m1288["name"], null)
  namespace_id = try(local.m1288["namespace_id"], null)
  object_type = try(local.m1288["object_type"], null)
  owners = try(local.m1288["owners"], null)
  path = try(local.m1288["path"], null)
  results = try(local.m1288["results"], null)
  shared_scope = try(local.m1288["shared_scope"], null)
  state = try(local.m1288["state"], null)
  subsystem_name = try(local.m1288["subsystem_name"], null)
  svm_name = try(local.m1288["svm_name"], null)
  uuid = try(local.m1288["uuid"], null)
  volume_name = try(local.m1288["volume_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1288["ancestors"], null) == null ? [] : local.m1288["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1288["array"], null) == null ? [] : local.m1288["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1288["parent"], null) == null ? [] : local.m1288["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1288["permission_resources"], null) == null ? [] : local.m1288["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_container" {
    for_each = try(local.m1288["storage_container"], null) == null ? [] : local.m1288["storage_container"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1288["storage_utilization"], null) == null ? [] : local.m1288["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1288["tags"], null) == null ? [] : local.m1288["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1288["version_context"], null) == null ? [] : local.m1288["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
