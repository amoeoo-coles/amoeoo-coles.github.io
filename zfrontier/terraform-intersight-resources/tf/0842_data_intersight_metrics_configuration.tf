# Sample data source intersight_metrics_configuration — reads ../models/data_intersight_metrics_configuration.yml
locals { m842 = yamldecode(file("${path.module}/../models/data_intersight_metrics_configuration.yml"))["data_intersight_metrics_configuration"] }

data "intersight_metrics_configuration" "n842" {
  account_moid = try(local.m842["account_moid"], null)
  additional_properties = try(local.m842["additional_properties"], null)
  class_id = try(local.m842["class_id"], null)
  collect_new_devices = try(local.m842["collect_new_devices"], null)
  collection_granularity = try(local.m842["collection_granularity"], null)
  create_time = try(local.m842["create_time"], null)
  domain_group_moid = try(local.m842["domain_group_moid"], null)
  enabled = try(local.m842["enabled"], null)
  id = try(local.m842["id"], null)
  limit = try(local.m842["limit"], null)
  mod_time = try(local.m842["mod_time"], null)
  moid = try(local.m842["moid"], null)
  object_type = try(local.m842["object_type"], null)
  owners = try(local.m842["owners"], null)
  results = try(local.m842["results"], null)
  shared_scope = try(local.m842["shared_scope"], null)
  user_max_ingestion_bytes = try(local.m842["user_max_ingestion_bytes"], null)
  dynamic "account" {
    for_each = try(local.m842["account"], null) == null ? [] : local.m842["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m842["ancestors"], null) == null ? [] : local.m842["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m842["parent"], null) == null ? [] : local.m842["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m842["permission_resources"], null) == null ? [] : local.m842["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m842["tags"], null) == null ? [] : local.m842["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m842["version_context"], null) == null ? [] : local.m842["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
