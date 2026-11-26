# Sample data source intersight_memory_persistent_memory_namespace — reads ../models/data_intersight_memory_persistent_memory_namespace.yml
locals { m826 = yamldecode(file("${path.module}/../models/data_intersight_memory_persistent_memory_namespace.yml"))["data_intersight_memory_persistent_memory_namespace"] }

data "intersight_memory_persistent_memory_namespace" "n826" {
  account_moid = try(local.m826["account_moid"], null)
  additional_properties = try(local.m826["additional_properties"], null)
  capacity = try(local.m826["capacity"], null)
  class_id = try(local.m826["class_id"], null)
  create_time = try(local.m826["create_time"], null)
  device_mo_id = try(local.m826["device_mo_id"], null)
  dn = try(local.m826["dn"], null)
  domain_group_moid = try(local.m826["domain_group_moid"], null)
  health_state = try(local.m826["health_state"], null)
  id = try(local.m826["id"], null)
  label_version = try(local.m826["label_version"], null)
  mod_time = try(local.m826["mod_time"], null)
  mode = try(local.m826["mode"], null)
  moid = try(local.m826["moid"], null)
  name = try(local.m826["name"], null)
  object_type = try(local.m826["object_type"], null)
  owners = try(local.m826["owners"], null)
  results = try(local.m826["results"], null)
  rn = try(local.m826["rn"], null)
  shared_scope = try(local.m826["shared_scope"], null)
  uuid = try(local.m826["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m826["ancestors"], null) == null ? [] : local.m826["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m826["inventory_device_info"], null) == null ? [] : local.m826["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "memory_persistent_memory_region" {
    for_each = try(local.m826["memory_persistent_memory_region"], null) == null ? [] : local.m826["memory_persistent_memory_region"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m826["parent"], null) == null ? [] : local.m826["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m826["permission_resources"], null) == null ? [] : local.m826["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m826["registered_device"], null) == null ? [] : local.m826["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m826["tags"], null) == null ? [] : local.m826["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m826["version_context"], null) == null ? [] : local.m826["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
