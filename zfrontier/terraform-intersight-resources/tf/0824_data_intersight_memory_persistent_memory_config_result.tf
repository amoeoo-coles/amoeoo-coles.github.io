# Sample data source intersight_memory_persistent_memory_config_result — reads ../models/data_intersight_memory_persistent_memory_config_result.yml
locals { m824 = yamldecode(file("${path.module}/../models/data_intersight_memory_persistent_memory_config_result.yml"))["data_intersight_memory_persistent_memory_config_result"] }

data "intersight_memory_persistent_memory_config_result" "n824" {
  account_moid = try(local.m824["account_moid"], null)
  additional_properties = try(local.m824["additional_properties"], null)
  class_id = try(local.m824["class_id"], null)
  config_error_desc = try(local.m824["config_error_desc"], null)
  config_result = try(local.m824["config_result"], null)
  config_sequence_no = try(local.m824["config_sequence_no"], null)
  config_state = try(local.m824["config_state"], null)
  create_time = try(local.m824["create_time"], null)
  device_mo_id = try(local.m824["device_mo_id"], null)
  dn = try(local.m824["dn"], null)
  domain_group_moid = try(local.m824["domain_group_moid"], null)
  id = try(local.m824["id"], null)
  mod_time = try(local.m824["mod_time"], null)
  moid = try(local.m824["moid"], null)
  object_type = try(local.m824["object_type"], null)
  owners = try(local.m824["owners"], null)
  results = try(local.m824["results"], null)
  rn = try(local.m824["rn"], null)
  shared_scope = try(local.m824["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m824["ancestors"], null) == null ? [] : local.m824["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m824["inventory_device_info"], null) == null ? [] : local.m824["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "memory_persistent_memory_configuration" {
    for_each = try(local.m824["memory_persistent_memory_configuration"], null) == null ? [] : local.m824["memory_persistent_memory_configuration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m824["parent"], null) == null ? [] : local.m824["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m824["permission_resources"], null) == null ? [] : local.m824["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "persistent_memory_namespace_config_results" {
    for_each = try(local.m824["persistent_memory_namespace_config_results"], null) == null ? [] : local.m824["persistent_memory_namespace_config_results"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m824["registered_device"], null) == null ? [] : local.m824["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m824["tags"], null) == null ? [] : local.m824["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m824["version_context"], null) == null ? [] : local.m824["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
