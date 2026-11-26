# Sample data source intersight_memory_array — reads ../models/data_intersight_memory_array.yml
locals { m823 = yamldecode(file("${path.module}/../models/data_intersight_memory_array.yml"))["data_intersight_memory_array"] }

data "intersight_memory_array" "n823" {
  account_moid = try(local.m823["account_moid"], null)
  additional_properties = try(local.m823["additional_properties"], null)
  array_id = try(local.m823["array_id"], null)
  class_id = try(local.m823["class_id"], null)
  cpu_id = try(local.m823["cpu_id"], null)
  create_time = try(local.m823["create_time"], null)
  current_capacity = try(local.m823["current_capacity"], null)
  device_mo_id = try(local.m823["device_mo_id"], null)
  dn = try(local.m823["dn"], null)
  domain_group_moid = try(local.m823["domain_group_moid"], null)
  error_correction = try(local.m823["error_correction"], null)
  id = try(local.m823["id"], null)
  is_upgraded = try(local.m823["is_upgraded"], null)
  max_capacity = try(local.m823["max_capacity"], null)
  max_devices = try(local.m823["max_devices"], null)
  mod_time = try(local.m823["mod_time"], null)
  model = try(local.m823["model"], null)
  moid = try(local.m823["moid"], null)
  object_type = try(local.m823["object_type"], null)
  oper_power_state = try(local.m823["oper_power_state"], null)
  owners = try(local.m823["owners"], null)
  presence = try(local.m823["presence"], null)
  results = try(local.m823["results"], null)
  revision = try(local.m823["revision"], null)
  rn = try(local.m823["rn"], null)
  serial = try(local.m823["serial"], null)
  shared_scope = try(local.m823["shared_scope"], null)
  vendor = try(local.m823["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m823["ancestors"], null) == null ? [] : local.m823["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m823["compute_blade"], null) == null ? [] : local.m823["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_board" {
    for_each = try(local.m823["compute_board"], null) == null ? [] : local.m823["compute_board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m823["compute_rack_unit"], null) == null ? [] : local.m823["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m823["inventory_device_info"], null) == null ? [] : local.m823["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m823["parent"], null) == null ? [] : local.m823["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m823["permission_resources"], null) == null ? [] : local.m823["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "persistent_memory_units" {
    for_each = try(local.m823["persistent_memory_units"], null) == null ? [] : local.m823["persistent_memory_units"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m823["previous_fru"], null) == null ? [] : local.m823["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m823["registered_device"], null) == null ? [] : local.m823["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m823["tags"], null) == null ? [] : local.m823["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "units" {
    for_each = try(local.m823["units"], null) == null ? [] : local.m823["units"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m823["version_context"], null) == null ? [] : local.m823["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
