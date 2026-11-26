# Sample data source intersight_compute_server_power_parameters — reads ../models/data_intersight_compute_server_power_parameters.yml
locals { m249 = yamldecode(file("${path.module}/../models/data_intersight_compute_server_power_parameters.yml"))["data_intersight_compute_server_power_parameters"] }

data "intersight_compute_server_power_parameters" "n249" {
  account_moid = try(local.m249["account_moid"], null)
  additional_properties = try(local.m249["additional_properties"], null)
  class_id = try(local.m249["class_id"], null)
  create_time = try(local.m249["create_time"], null)
  device_mo_id = try(local.m249["device_mo_id"], null)
  dn = try(local.m249["dn"], null)
  domain_group_moid = try(local.m249["domain_group_moid"], null)
  id = try(local.m249["id"], null)
  mod_time = try(local.m249["mod_time"], null)
  moid = try(local.m249["moid"], null)
  object_type = try(local.m249["object_type"], null)
  owners = try(local.m249["owners"], null)
  power_allocation = try(local.m249["power_allocation"], null)
  power_priority = try(local.m249["power_priority"], null)
  power_profiling = try(local.m249["power_profiling"], null)
  power_restore = try(local.m249["power_restore"], null)
  processor_package_power_limit = try(local.m249["processor_package_power_limit"], null)
  results = try(local.m249["results"], null)
  rn = try(local.m249["rn"], null)
  shared_scope = try(local.m249["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m249["ancestors"], null) == null ? [] : local.m249["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m249["compute_blade"], null) == null ? [] : local.m249["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m249["compute_rack_unit"], null) == null ? [] : local.m249["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m249["parent"], null) == null ? [] : local.m249["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m249["permission_resources"], null) == null ? [] : local.m249["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m249["registered_device"], null) == null ? [] : local.m249["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m249["tags"], null) == null ? [] : local.m249["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m249["version_context"], null) == null ? [] : local.m249["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
