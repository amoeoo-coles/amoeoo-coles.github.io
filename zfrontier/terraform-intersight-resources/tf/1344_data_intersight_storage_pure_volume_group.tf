# Sample data source intersight_storage_pure_volume_group — reads ../models/data_intersight_storage_pure_volume_group.yml
locals { m1344 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_volume_group.yml"))["data_intersight_storage_pure_volume_group"] }

data "intersight_storage_pure_volume_group" "n1344" {
  account_moid = try(local.m1344["account_moid"], null)
  additional_properties = try(local.m1344["additional_properties"], null)
  class_id = try(local.m1344["class_id"], null)
  create_time = try(local.m1344["create_time"], null)
  domain_group_moid = try(local.m1344["domain_group_moid"], null)
  id = try(local.m1344["id"], null)
  mod_time = try(local.m1344["mod_time"], null)
  moid = try(local.m1344["moid"], null)
  name = try(local.m1344["name"], null)
  object_type = try(local.m1344["object_type"], null)
  owners = try(local.m1344["owners"], null)
  results = try(local.m1344["results"], null)
  shared_scope = try(local.m1344["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1344["ancestors"], null) == null ? [] : local.m1344["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1344["array"], null) == null ? [] : local.m1344["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1344["parent"], null) == null ? [] : local.m1344["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1344["permission_resources"], null) == null ? [] : local.m1344["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1344["registered_device"], null) == null ? [] : local.m1344["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1344["tags"], null) == null ? [] : local.m1344["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1344["version_context"], null) == null ? [] : local.m1344["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
