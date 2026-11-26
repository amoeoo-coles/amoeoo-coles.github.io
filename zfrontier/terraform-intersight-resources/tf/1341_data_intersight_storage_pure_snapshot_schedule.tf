# Sample data source intersight_storage_pure_snapshot_schedule — reads ../models/data_intersight_storage_pure_snapshot_schedule.yml
locals { m1341 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_snapshot_schedule.yml"))["data_intersight_storage_pure_snapshot_schedule"] }

data "intersight_storage_pure_snapshot_schedule" "n1341" {
  account_moid = try(local.m1341["account_moid"], null)
  additional_properties = try(local.m1341["additional_properties"], null)
  class_id = try(local.m1341["class_id"], null)
  create_time = try(local.m1341["create_time"], null)
  daily_limit = try(local.m1341["daily_limit"], null)
  domain_group_moid = try(local.m1341["domain_group_moid"], null)
  frequency = try(local.m1341["frequency"], null)
  id = try(local.m1341["id"], null)
  mod_time = try(local.m1341["mod_time"], null)
  moid = try(local.m1341["moid"], null)
  name = try(local.m1341["name"], null)
  object_type = try(local.m1341["object_type"], null)
  owners = try(local.m1341["owners"], null)
  results = try(local.m1341["results"], null)
  retention_time = try(local.m1341["retention_time"], null)
  shared_scope = try(local.m1341["shared_scope"], null)
  snapshot_expiry_time = try(local.m1341["snapshot_expiry_time"], null)
  snapshot_time = try(local.m1341["snapshot_time"], null)
  dynamic "ancestors" {
    for_each = try(local.m1341["ancestors"], null) == null ? [] : local.m1341["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1341["array"], null) == null ? [] : local.m1341["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1341["parent"], null) == null ? [] : local.m1341["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1341["permission_resources"], null) == null ? [] : local.m1341["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "protection_group" {
    for_each = try(local.m1341["protection_group"], null) == null ? [] : local.m1341["protection_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1341["registered_device"], null) == null ? [] : local.m1341["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1341["tags"], null) == null ? [] : local.m1341["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1341["version_context"], null) == null ? [] : local.m1341["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
