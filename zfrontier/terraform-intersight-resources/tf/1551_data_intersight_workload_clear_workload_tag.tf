# Sample data source intersight_workload_clear_workload_tag — reads ../models/data_intersight_workload_clear_workload_tag.yml
locals { m1551 = yamldecode(file("${path.module}/../models/data_intersight_workload_clear_workload_tag.yml"))["data_intersight_workload_clear_workload_tag"] }

data "intersight_workload_clear_workload_tag" "n1551" {
  account_moid = try(local.m1551["account_moid"], null)
  additional_properties = try(local.m1551["additional_properties"], null)
  class_id = try(local.m1551["class_id"], null)
  create_time = try(local.m1551["create_time"], null)
  domain_group_moid = try(local.m1551["domain_group_moid"], null)
  id = try(local.m1551["id"], null)
  mod_time = try(local.m1551["mod_time"], null)
  moid = try(local.m1551["moid"], null)
  object_type = try(local.m1551["object_type"], null)
  owners = try(local.m1551["owners"], null)
  results = try(local.m1551["results"], null)
  shared_scope = try(local.m1551["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1551["ancestors"], null) == null ? [] : local.m1551["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "objects" {
    for_each = try(local.m1551["objects"], null) == null ? [] : local.m1551["objects"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1551["parent"], null) == null ? [] : local.m1551["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1551["permission_resources"], null) == null ? [] : local.m1551["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1551["tags"], null) == null ? [] : local.m1551["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1551["version_context"], null) == null ? [] : local.m1551["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
