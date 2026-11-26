# Sample data source intersight_storage_pure_replication_schedule — reads ../models/data_intersight_storage_pure_replication_schedule.yml
locals { m1339 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_replication_schedule.yml"))["data_intersight_storage_pure_replication_schedule"] }

data "intersight_storage_pure_replication_schedule" "n1339" {
  account_moid = try(local.m1339["account_moid"], null)
  additional_properties = try(local.m1339["additional_properties"], null)
  class_id = try(local.m1339["class_id"], null)
  create_time = try(local.m1339["create_time"], null)
  daily_limit = try(local.m1339["daily_limit"], null)
  domain_group_moid = try(local.m1339["domain_group_moid"], null)
  frequency = try(local.m1339["frequency"], null)
  id = try(local.m1339["id"], null)
  mod_time = try(local.m1339["mod_time"], null)
  moid = try(local.m1339["moid"], null)
  name = try(local.m1339["name"], null)
  object_type = try(local.m1339["object_type"], null)
  owners = try(local.m1339["owners"], null)
  replication_time = try(local.m1339["replication_time"], null)
  results = try(local.m1339["results"], null)
  retention_time = try(local.m1339["retention_time"], null)
  shared_scope = try(local.m1339["shared_scope"], null)
  snapshot_expiry_time = try(local.m1339["snapshot_expiry_time"], null)
  dynamic "ancestors" {
    for_each = try(local.m1339["ancestors"], null) == null ? [] : local.m1339["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1339["array"], null) == null ? [] : local.m1339["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1339["parent"], null) == null ? [] : local.m1339["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1339["permission_resources"], null) == null ? [] : local.m1339["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "protection_group" {
    for_each = try(local.m1339["protection_group"], null) == null ? [] : local.m1339["protection_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1339["registered_device"], null) == null ? [] : local.m1339["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "replication_blackout_intervals" {
    for_each = try(local.m1339["replication_blackout_intervals"], null) == null ? [] : local.m1339["replication_blackout_intervals"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1339["tags"], null) == null ? [] : local.m1339["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1339["version_context"], null) == null ? [] : local.m1339["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
