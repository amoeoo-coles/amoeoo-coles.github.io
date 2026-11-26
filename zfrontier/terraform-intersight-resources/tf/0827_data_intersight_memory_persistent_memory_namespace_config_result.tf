# Sample data source intersight_memory_persistent_memory_namespace_config_result — reads ../models/data_intersight_memory_persistent_memory_namespace_config_result.yml
locals { m827 = yamldecode(file("${path.module}/../models/data_intersight_memory_persistent_memory_namespace_config_result.yml"))["data_intersight_memory_persistent_memory_namespace_config_result"] }

data "intersight_memory_persistent_memory_namespace_config_result" "n827" {
  account_moid = try(local.m827["account_moid"], null)
  additional_properties = try(local.m827["additional_properties"], null)
  class_id = try(local.m827["class_id"], null)
  config_status = try(local.m827["config_status"], null)
  create_time = try(local.m827["create_time"], null)
  device_mo_id = try(local.m827["device_mo_id"], null)
  dn = try(local.m827["dn"], null)
  domain_group_moid = try(local.m827["domain_group_moid"], null)
  id = try(local.m827["id"], null)
  mod_time = try(local.m827["mod_time"], null)
  moid = try(local.m827["moid"], null)
  name = try(local.m827["name"], null)
  object_type = try(local.m827["object_type"], null)
  owners = try(local.m827["owners"], null)
  results = try(local.m827["results"], null)
  rn = try(local.m827["rn"], null)
  shared_scope = try(local.m827["shared_scope"], null)
  socket_id = try(local.m827["socket_id"], null)
  socket_memory_id = try(local.m827["socket_memory_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m827["ancestors"], null) == null ? [] : local.m827["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m827["inventory_device_info"], null) == null ? [] : local.m827["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "memory_persistent_memory_config_result" {
    for_each = try(local.m827["memory_persistent_memory_config_result"], null) == null ? [] : local.m827["memory_persistent_memory_config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m827["parent"], null) == null ? [] : local.m827["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m827["permission_resources"], null) == null ? [] : local.m827["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m827["registered_device"], null) == null ? [] : local.m827["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m827["tags"], null) == null ? [] : local.m827["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m827["version_context"], null) == null ? [] : local.m827["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
