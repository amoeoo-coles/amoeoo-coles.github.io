# Sample data source intersight_memory_persistent_memory_configuration — reads ../models/data_intersight_memory_persistent_memory_configuration.yml
locals { m825 = yamldecode(file("${path.module}/../models/data_intersight_memory_persistent_memory_configuration.yml"))["data_intersight_memory_persistent_memory_configuration"] }

data "intersight_memory_persistent_memory_configuration" "n825" {
  account_moid = try(local.m825["account_moid"], null)
  additional_properties = try(local.m825["additional_properties"], null)
  class_id = try(local.m825["class_id"], null)
  create_time = try(local.m825["create_time"], null)
  device_mo_id = try(local.m825["device_mo_id"], null)
  dn = try(local.m825["dn"], null)
  domain_group_moid = try(local.m825["domain_group_moid"], null)
  id = try(local.m825["id"], null)
  memory_capacity = try(local.m825["memory_capacity"], null)
  mod_time = try(local.m825["mod_time"], null)
  moid = try(local.m825["moid"], null)
  num_of_modules = try(local.m825["num_of_modules"], null)
  num_of_regions = try(local.m825["num_of_regions"], null)
  object_type = try(local.m825["object_type"], null)
  owners = try(local.m825["owners"], null)
  persistent_memory_capacity = try(local.m825["persistent_memory_capacity"], null)
  reserved_capacity = try(local.m825["reserved_capacity"], null)
  results = try(local.m825["results"], null)
  rn = try(local.m825["rn"], null)
  security_state = try(local.m825["security_state"], null)
  shared_scope = try(local.m825["shared_scope"], null)
  total_capacity = try(local.m825["total_capacity"], null)
  dynamic "ancestors" {
    for_each = try(local.m825["ancestors"], null) == null ? [] : local.m825["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_board" {
    for_each = try(local.m825["compute_board"], null) == null ? [] : local.m825["compute_board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m825["inventory_device_info"], null) == null ? [] : local.m825["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m825["parent"], null) == null ? [] : local.m825["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m825["permission_resources"], null) == null ? [] : local.m825["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "persistent_memory_config_result" {
    for_each = try(local.m825["persistent_memory_config_result"], null) == null ? [] : local.m825["persistent_memory_config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "persistent_memory_regions" {
    for_each = try(local.m825["persistent_memory_regions"], null) == null ? [] : local.m825["persistent_memory_regions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m825["registered_device"], null) == null ? [] : local.m825["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m825["tags"], null) == null ? [] : local.m825["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m825["version_context"], null) == null ? [] : local.m825["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
