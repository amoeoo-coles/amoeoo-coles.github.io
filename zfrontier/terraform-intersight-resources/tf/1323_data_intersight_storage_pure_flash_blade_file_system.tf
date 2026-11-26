# Sample data source intersight_storage_pure_flash_blade_file_system — reads ../models/data_intersight_storage_pure_flash_blade_file_system.yml
locals { m1323 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_flash_blade_file_system.yml"))["data_intersight_storage_pure_flash_blade_file_system"] }

data "intersight_storage_pure_flash_blade_file_system" "n1323" {
  account_moid = try(local.m1323["account_moid"], null)
  additional_properties = try(local.m1323["additional_properties"], null)
  class_id = try(local.m1323["class_id"], null)
  create_time = try(local.m1323["create_time"], null)
  created_time = try(local.m1323["created_time"], null)
  destroyed = try(local.m1323["destroyed"], null)
  domain_group_moid = try(local.m1323["domain_group_moid"], null)
  file_system_id = try(local.m1323["file_system_id"], null)
  hard_limit_enabled = try(local.m1323["hard_limit_enabled"], null)
  id = try(local.m1323["id"], null)
  mod_time = try(local.m1323["mod_time"], null)
  moid = try(local.m1323["moid"], null)
  name = try(local.m1323["name"], null)
  object_type = try(local.m1323["object_type"], null)
  owners = try(local.m1323["owners"], null)
  promotion_status = try(local.m1323["promotion_status"], null)
  provisioned = try(local.m1323["provisioned"], null)
  results = try(local.m1323["results"], null)
  shared_scope = try(local.m1323["shared_scope"], null)
  writable = try(local.m1323["writable"], null)
  dynamic "ancestors" {
    for_each = try(local.m1323["ancestors"], null) == null ? [] : local.m1323["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1323["array"], null) == null ? [] : local.m1323["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1323["parent"], null) == null ? [] : local.m1323["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1323["permission_resources"], null) == null ? [] : local.m1323["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1323["registered_device"], null) == null ? [] : local.m1323["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1323["storage_utilization"], null) == null ? [] : local.m1323["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1323["tags"], null) == null ? [] : local.m1323["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1323["version_context"], null) == null ? [] : local.m1323["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
