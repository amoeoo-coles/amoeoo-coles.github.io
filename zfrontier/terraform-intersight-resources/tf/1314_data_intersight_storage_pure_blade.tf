# Sample data source intersight_storage_pure_blade — reads ../models/data_intersight_storage_pure_blade.yml
locals { m1314 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_blade.yml"))["data_intersight_storage_pure_blade"] }

data "intersight_storage_pure_blade" "n1314" {
  account_moid = try(local.m1314["account_moid"], null)
  additional_properties = try(local.m1314["additional_properties"], null)
  blade_id = try(local.m1314["blade_id"], null)
  class_id = try(local.m1314["class_id"], null)
  create_time = try(local.m1314["create_time"], null)
  domain_group_moid = try(local.m1314["domain_group_moid"], null)
  id = try(local.m1314["id"], null)
  mod_time = try(local.m1314["mod_time"], null)
  moid = try(local.m1314["moid"], null)
  name = try(local.m1314["name"], null)
  object_type = try(local.m1314["object_type"], null)
  owners = try(local.m1314["owners"], null)
  raw_capacity = try(local.m1314["raw_capacity"], null)
  results = try(local.m1314["results"], null)
  shared_scope = try(local.m1314["shared_scope"], null)
  status = try(local.m1314["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m1314["ancestors"], null) == null ? [] : local.m1314["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1314["array"], null) == null ? [] : local.m1314["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1314["parent"], null) == null ? [] : local.m1314["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1314["permission_resources"], null) == null ? [] : local.m1314["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1314["registered_device"], null) == null ? [] : local.m1314["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1314["tags"], null) == null ? [] : local.m1314["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1314["version_context"], null) == null ? [] : local.m1314["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
