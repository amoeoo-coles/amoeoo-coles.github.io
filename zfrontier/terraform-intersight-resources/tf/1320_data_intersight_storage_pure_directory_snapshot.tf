# Sample data source intersight_storage_pure_directory_snapshot — reads ../models/data_intersight_storage_pure_directory_snapshot.yml
locals { m1320 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_directory_snapshot.yml"))["data_intersight_storage_pure_directory_snapshot"] }

data "intersight_storage_pure_directory_snapshot" "n1320" {
  account_moid = try(local.m1320["account_moid"], null)
  additional_properties = try(local.m1320["additional_properties"], null)
  class_id = try(local.m1320["class_id"], null)
  client_name = try(local.m1320["client_name"], null)
  create_time = try(local.m1320["create_time"], null)
  created_time = try(local.m1320["created_time"], null)
  domain_group_moid = try(local.m1320["domain_group_moid"], null)
  id = try(local.m1320["id"], null)
  mod_time = try(local.m1320["mod_time"], null)
  moid = try(local.m1320["moid"], null)
  name = try(local.m1320["name"], null)
  nr_source = try(local.m1320["nr_source"], null)
  object_type = try(local.m1320["object_type"], null)
  owners = try(local.m1320["owners"], null)
  results = try(local.m1320["results"], null)
  shared_scope = try(local.m1320["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1320["ancestors"], null) == null ? [] : local.m1320["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1320["array"], null) == null ? [] : local.m1320["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "directory" {
    for_each = try(local.m1320["directory"], null) == null ? [] : local.m1320["directory"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1320["parent"], null) == null ? [] : local.m1320["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1320["permission_resources"], null) == null ? [] : local.m1320["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1320["registered_device"], null) == null ? [] : local.m1320["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1320["tags"], null) == null ? [] : local.m1320["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1320["version_context"], null) == null ? [] : local.m1320["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
