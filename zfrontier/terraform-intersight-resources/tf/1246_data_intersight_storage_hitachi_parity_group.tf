# Sample data source intersight_storage_hitachi_parity_group — reads ../models/data_intersight_storage_hitachi_parity_group.yml
locals { m1246 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_parity_group.yml"))["data_intersight_storage_hitachi_parity_group"] }

data "intersight_storage_hitachi_parity_group" "n1246" {
  account_moid = try(local.m1246["account_moid"], null)
  additional_properties = try(local.m1246["additional_properties"], null)
  class_id = try(local.m1246["class_id"], null)
  create_time = try(local.m1246["create_time"], null)
  disk_speed = try(local.m1246["disk_speed"], null)
  disk_type = try(local.m1246["disk_type"], null)
  domain_group_moid = try(local.m1246["domain_group_moid"], null)
  id = try(local.m1246["id"], null)
  is_accelerated_compression_enabled = try(local.m1246["is_accelerated_compression_enabled"], null)
  is_copy_back_mode_enabled = try(local.m1246["is_copy_back_mode_enabled"], null)
  is_encryption_enabled = try(local.m1246["is_encryption_enabled"], null)
  level = try(local.m1246["level"], null)
  mod_time = try(local.m1246["mod_time"], null)
  moid = try(local.m1246["moid"], null)
  name = try(local.m1246["name"], null)
  object_type = try(local.m1246["object_type"], null)
  owners = try(local.m1246["owners"], null)
  results = try(local.m1246["results"], null)
  shared_scope = try(local.m1246["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1246["ancestors"], null) == null ? [] : local.m1246["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1246["array"], null) == null ? [] : local.m1246["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1246["parent"], null) == null ? [] : local.m1246["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1246["permission_resources"], null) == null ? [] : local.m1246["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1246["registered_device"], null) == null ? [] : local.m1246["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1246["storage_utilization"], null) == null ? [] : local.m1246["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1246["tags"], null) == null ? [] : local.m1246["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1246["version_context"], null) == null ? [] : local.m1246["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
