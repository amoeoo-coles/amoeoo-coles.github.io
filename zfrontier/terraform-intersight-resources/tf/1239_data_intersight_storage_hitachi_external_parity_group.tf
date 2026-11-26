# Sample data source intersight_storage_hitachi_external_parity_group — reads ../models/data_intersight_storage_hitachi_external_parity_group.yml
locals { m1239 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_external_parity_group.yml"))["data_intersight_storage_hitachi_external_parity_group"] }

data "intersight_storage_hitachi_external_parity_group" "n1239" {
  account_moid = try(local.m1239["account_moid"], null)
  additional_properties = try(local.m1239["additional_properties"], null)
  allocatable_open_volume_capacity = try(local.m1239["allocatable_open_volume_capacity"], null)
  allocated_open_volume_capacity = try(local.m1239["allocated_open_volume_capacity"], null)
  available_volume_capacity = try(local.m1239["available_volume_capacity"], null)
  class_id = try(local.m1239["class_id"], null)
  clpr_id = try(local.m1239["clpr_id"], null)
  create_time = try(local.m1239["create_time"], null)
  domain_group_moid = try(local.m1239["domain_group_moid"], null)
  emulation_type = try(local.m1239["emulation_type"], null)
  external_product_id = try(local.m1239["external_product_id"], null)
  id = try(local.m1239["id"], null)
  largest_available_capacity = try(local.m1239["largest_available_capacity"], null)
  mod_time = try(local.m1239["mod_time"], null)
  moid = try(local.m1239["moid"], null)
  name = try(local.m1239["name"], null)
  object_type = try(local.m1239["object_type"], null)
  owners = try(local.m1239["owners"], null)
  reserved_open_volume_capacity = try(local.m1239["reserved_open_volume_capacity"], null)
  results = try(local.m1239["results"], null)
  shared_scope = try(local.m1239["shared_scope"], null)
  total_open_volume_capacity = try(local.m1239["total_open_volume_capacity"], null)
  unallocated_open_volume_capacity = try(local.m1239["unallocated_open_volume_capacity"], null)
  used_capacity_rate = try(local.m1239["used_capacity_rate"], null)
  dynamic "ancestors" {
    for_each = try(local.m1239["ancestors"], null) == null ? [] : local.m1239["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1239["array"], null) == null ? [] : local.m1239["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1239["parent"], null) == null ? [] : local.m1239["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1239["permission_resources"], null) == null ? [] : local.m1239["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1239["registered_device"], null) == null ? [] : local.m1239["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "spaces" {
    for_each = try(local.m1239["spaces"], null) == null ? [] : local.m1239["spaces"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1239["storage_utilization"], null) == null ? [] : local.m1239["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1239["tags"], null) == null ? [] : local.m1239["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1239["version_context"], null) == null ? [] : local.m1239["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
