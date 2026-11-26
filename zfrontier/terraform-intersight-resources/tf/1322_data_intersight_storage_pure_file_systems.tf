# Sample data source intersight_storage_pure_file_systems — reads ../models/data_intersight_storage_pure_file_systems.yml
locals { m1322 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_file_systems.yml"))["data_intersight_storage_pure_file_systems"] }

data "intersight_storage_pure_file_systems" "n1322" {
  account_moid = try(local.m1322["account_moid"], null)
  additional_properties = try(local.m1322["additional_properties"], null)
  class_id = try(local.m1322["class_id"], null)
  create_time = try(local.m1322["create_time"], null)
  created_time = try(local.m1322["created_time"], null)
  destroyed = try(local.m1322["destroyed"], null)
  domain_group_moid = try(local.m1322["domain_group_moid"], null)
  id = try(local.m1322["id"], null)
  mod_time = try(local.m1322["mod_time"], null)
  moid = try(local.m1322["moid"], null)
  name = try(local.m1322["name"], null)
  object_type = try(local.m1322["object_type"], null)
  owners = try(local.m1322["owners"], null)
  pod = try(local.m1322["pod"], null)
  results = try(local.m1322["results"], null)
  shared_scope = try(local.m1322["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1322["ancestors"], null) == null ? [] : local.m1322["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1322["array"], null) == null ? [] : local.m1322["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1322["parent"], null) == null ? [] : local.m1322["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1322["permission_resources"], null) == null ? [] : local.m1322["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1322["registered_device"], null) == null ? [] : local.m1322["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1322["tags"], null) == null ? [] : local.m1322["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1322["version_context"], null) == null ? [] : local.m1322["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
