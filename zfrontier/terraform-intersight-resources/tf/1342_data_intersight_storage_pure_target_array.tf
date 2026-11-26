# Sample data source intersight_storage_pure_target_array — reads ../models/data_intersight_storage_pure_target_array.yml
locals { m1342 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_target_array.yml"))["data_intersight_storage_pure_target_array"] }

data "intersight_storage_pure_target_array" "n1342" {
  account_moid = try(local.m1342["account_moid"], null)
  additional_properties = try(local.m1342["additional_properties"], null)
  class_id = try(local.m1342["class_id"], null)
  create_time = try(local.m1342["create_time"], null)
  domain_group_moid = try(local.m1342["domain_group_moid"], null)
  id = try(local.m1342["id"], null)
  mod_time = try(local.m1342["mod_time"], null)
  moid = try(local.m1342["moid"], null)
  name = try(local.m1342["name"], null)
  object_type = try(local.m1342["object_type"], null)
  owners = try(local.m1342["owners"], null)
  results = try(local.m1342["results"], null)
  shared_scope = try(local.m1342["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1342["ancestors"], null) == null ? [] : local.m1342["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1342["array"], null) == null ? [] : local.m1342["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1342["parent"], null) == null ? [] : local.m1342["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1342["permission_resources"], null) == null ? [] : local.m1342["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1342["registered_device"], null) == null ? [] : local.m1342["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1342["tags"], null) == null ? [] : local.m1342["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1342["version_context"], null) == null ? [] : local.m1342["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
