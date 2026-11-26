# Sample data source intersight_storage_pure_pod — reads ../models/data_intersight_storage_pure_pod.yml
locals { m1333 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_pod.yml"))["data_intersight_storage_pure_pod"] }

data "intersight_storage_pure_pod" "n1333" {
  account_moid = try(local.m1333["account_moid"], null)
  additional_properties = try(local.m1333["additional_properties"], null)
  array_count = try(local.m1333["array_count"], null)
  class_id = try(local.m1333["class_id"], null)
  create_time = try(local.m1333["create_time"], null)
  destroyed = try(local.m1333["destroyed"], null)
  domain_group_moid = try(local.m1333["domain_group_moid"], null)
  id = try(local.m1333["id"], null)
  link_target_count = try(local.m1333["link_target_count"], null)
  mediator = try(local.m1333["mediator"], null)
  mod_time = try(local.m1333["mod_time"], null)
  moid = try(local.m1333["moid"], null)
  name = try(local.m1333["name"], null)
  object_type = try(local.m1333["object_type"], null)
  owners = try(local.m1333["owners"], null)
  promotion_status = try(local.m1333["promotion_status"], null)
  realm_name = try(local.m1333["realm_name"], null)
  results = try(local.m1333["results"], null)
  shared_scope = try(local.m1333["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1333["ancestors"], null) == null ? [] : local.m1333["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1333["array"], null) == null ? [] : local.m1333["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1333["parent"], null) == null ? [] : local.m1333["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1333["permission_resources"], null) == null ? [] : local.m1333["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "protection_groups" {
    for_each = try(local.m1333["protection_groups"], null) == null ? [] : local.m1333["protection_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "realm" {
    for_each = try(local.m1333["realm"], null) == null ? [] : local.m1333["realm"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1333["registered_device"], null) == null ? [] : local.m1333["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1333["storage_utilization"], null) == null ? [] : local.m1333["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1333["tags"], null) == null ? [] : local.m1333["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1333["version_context"], null) == null ? [] : local.m1333["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "volumes" {
    for_each = try(local.m1333["volumes"], null) == null ? [] : local.m1333["volumes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
