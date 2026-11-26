# Sample data source intersight_memory_persistent_memory_region — reads ../models/data_intersight_memory_persistent_memory_region.yml
locals { m829 = yamldecode(file("${path.module}/../models/data_intersight_memory_persistent_memory_region.yml"))["data_intersight_memory_persistent_memory_region"] }

data "intersight_memory_persistent_memory_region" "n829" {
  account_moid = try(local.m829["account_moid"], null)
  additional_properties = try(local.m829["additional_properties"], null)
  class_id = try(local.m829["class_id"], null)
  create_time = try(local.m829["create_time"], null)
  device_mo_id = try(local.m829["device_mo_id"], null)
  dn = try(local.m829["dn"], null)
  domain_group_moid = try(local.m829["domain_group_moid"], null)
  free_capacity = try(local.m829["free_capacity"], null)
  health_state = try(local.m829["health_state"], null)
  id = try(local.m829["id"], null)
  interleaved_set_id = try(local.m829["interleaved_set_id"], null)
  locater_ids = try(local.m829["locater_ids"], null)
  mod_time = try(local.m829["mod_time"], null)
  moid = try(local.m829["moid"], null)
  object_type = try(local.m829["object_type"], null)
  owners = try(local.m829["owners"], null)
  persistent_memory_type = try(local.m829["persistent_memory_type"], null)
  region_id = try(local.m829["region_id"], null)
  results = try(local.m829["results"], null)
  rn = try(local.m829["rn"], null)
  shared_scope = try(local.m829["shared_scope"], null)
  socket_id = try(local.m829["socket_id"], null)
  socket_memory_id = try(local.m829["socket_memory_id"], null)
  total_capacity = try(local.m829["total_capacity"], null)
  dynamic "ancestors" {
    for_each = try(local.m829["ancestors"], null) == null ? [] : local.m829["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m829["inventory_device_info"], null) == null ? [] : local.m829["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "memory_persistent_memory_configuration" {
    for_each = try(local.m829["memory_persistent_memory_configuration"], null) == null ? [] : local.m829["memory_persistent_memory_configuration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m829["parent"], null) == null ? [] : local.m829["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m829["permission_resources"], null) == null ? [] : local.m829["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "persistent_memory_namespaces" {
    for_each = try(local.m829["persistent_memory_namespaces"], null) == null ? [] : local.m829["persistent_memory_namespaces"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m829["registered_device"], null) == null ? [] : local.m829["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m829["tags"], null) == null ? [] : local.m829["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m829["version_context"], null) == null ? [] : local.m829["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
