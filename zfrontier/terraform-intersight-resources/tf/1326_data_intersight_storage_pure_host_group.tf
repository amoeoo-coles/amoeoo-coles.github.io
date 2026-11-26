# Sample data source intersight_storage_pure_host_group — reads ../models/data_intersight_storage_pure_host_group.yml
locals { m1326 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_host_group.yml"))["data_intersight_storage_pure_host_group"] }

data "intersight_storage_pure_host_group" "n1326" {
  account_moid = try(local.m1326["account_moid"], null)
  additional_properties = try(local.m1326["additional_properties"], null)
  class_id = try(local.m1326["class_id"], null)
  create_time = try(local.m1326["create_time"], null)
  description = try(local.m1326["description"], null)
  domain_group_moid = try(local.m1326["domain_group_moid"], null)
  host_names = try(local.m1326["host_names"], null)
  id = try(local.m1326["id"], null)
  mod_time = try(local.m1326["mod_time"], null)
  moid = try(local.m1326["moid"], null)
  name = try(local.m1326["name"], null)
  object_type = try(local.m1326["object_type"], null)
  owners = try(local.m1326["owners"], null)
  results = try(local.m1326["results"], null)
  shared_scope = try(local.m1326["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1326["ancestors"], null) == null ? [] : local.m1326["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1326["array"], null) == null ? [] : local.m1326["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hosts" {
    for_each = try(local.m1326["hosts"], null) == null ? [] : local.m1326["hosts"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1326["parent"], null) == null ? [] : local.m1326["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1326["permission_resources"], null) == null ? [] : local.m1326["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "protection_group" {
    for_each = try(local.m1326["protection_group"], null) == null ? [] : local.m1326["protection_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1326["registered_device"], null) == null ? [] : local.m1326["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1326["storage_utilization"], null) == null ? [] : local.m1326["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1326["tags"], null) == null ? [] : local.m1326["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1326["version_context"], null) == null ? [] : local.m1326["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
