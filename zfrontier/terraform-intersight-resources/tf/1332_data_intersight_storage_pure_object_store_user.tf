# Sample data source intersight_storage_pure_object_store_user — reads ../models/data_intersight_storage_pure_object_store_user.yml
locals { m1332 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_object_store_user.yml"))["data_intersight_storage_pure_object_store_user"] }

data "intersight_storage_pure_object_store_user" "n1332" {
  account_moid = try(local.m1332["account_moid"], null)
  additional_properties = try(local.m1332["additional_properties"], null)
  class_id = try(local.m1332["class_id"], null)
  create_time = try(local.m1332["create_time"], null)
  created = try(local.m1332["created"], null)
  domain_group_moid = try(local.m1332["domain_group_moid"], null)
  id = try(local.m1332["id"], null)
  mod_time = try(local.m1332["mod_time"], null)
  moid = try(local.m1332["moid"], null)
  name = try(local.m1332["name"], null)
  object_store_account_name = try(local.m1332["object_store_account_name"], null)
  object_type = try(local.m1332["object_type"], null)
  owners = try(local.m1332["owners"], null)
  results = try(local.m1332["results"], null)
  shared_scope = try(local.m1332["shared_scope"], null)
  uuid = try(local.m1332["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1332["ancestors"], null) == null ? [] : local.m1332["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1332["array"], null) == null ? [] : local.m1332["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "object_store_account" {
    for_each = try(local.m1332["object_store_account"], null) == null ? [] : local.m1332["object_store_account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1332["parent"], null) == null ? [] : local.m1332["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1332["permission_resources"], null) == null ? [] : local.m1332["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1332["registered_device"], null) == null ? [] : local.m1332["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1332["tags"], null) == null ? [] : local.m1332["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1332["version_context"], null) == null ? [] : local.m1332["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
