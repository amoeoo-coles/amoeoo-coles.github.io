# Sample data source intersight_storage_pure_object_store_account — reads ../models/data_intersight_storage_pure_object_store_account.yml
locals { m1331 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_object_store_account.yml"))["data_intersight_storage_pure_object_store_account"] }

data "intersight_storage_pure_object_store_account" "n1331" {
  account_moid = try(local.m1331["account_moid"], null)
  additional_properties = try(local.m1331["additional_properties"], null)
  class_id = try(local.m1331["class_id"], null)
  create_time = try(local.m1331["create_time"], null)
  created = try(local.m1331["created"], null)
  domain_group_moid = try(local.m1331["domain_group_moid"], null)
  hard_limit_enabled = try(local.m1331["hard_limit_enabled"], null)
  id = try(local.m1331["id"], null)
  mod_time = try(local.m1331["mod_time"], null)
  moid = try(local.m1331["moid"], null)
  name = try(local.m1331["name"], null)
  object_count = try(local.m1331["object_count"], null)
  object_type = try(local.m1331["object_type"], null)
  owners = try(local.m1331["owners"], null)
  quota_limit = try(local.m1331["quota_limit"], null)
  results = try(local.m1331["results"], null)
  shared_scope = try(local.m1331["shared_scope"], null)
  uuid = try(local.m1331["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1331["ancestors"], null) == null ? [] : local.m1331["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1331["array"], null) == null ? [] : local.m1331["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1331["parent"], null) == null ? [] : local.m1331["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1331["permission_resources"], null) == null ? [] : local.m1331["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1331["registered_device"], null) == null ? [] : local.m1331["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1331["storage_utilization"], null) == null ? [] : local.m1331["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1331["tags"], null) == null ? [] : local.m1331["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1331["version_context"], null) == null ? [] : local.m1331["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
