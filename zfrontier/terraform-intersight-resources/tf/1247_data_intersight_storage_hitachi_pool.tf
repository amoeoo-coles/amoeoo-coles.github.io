# Sample data source intersight_storage_hitachi_pool — reads ../models/data_intersight_storage_hitachi_pool.yml
locals { m1247 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_pool.yml"))["data_intersight_storage_hitachi_pool"] }

data "intersight_storage_hitachi_pool" "n1247" {
  account_moid = try(local.m1247["account_moid"], null)
  additional_properties = try(local.m1247["additional_properties"], null)
  blocking_mode_blockade = try(local.m1247["blocking_mode_blockade"], null)
  blocking_mode_full = try(local.m1247["blocking_mode_full"], null)
  class_id = try(local.m1247["class_id"], null)
  create_time = try(local.m1247["create_time"], null)
  depletion_threshold = try(local.m1247["depletion_threshold"], null)
  domain_group_moid = try(local.m1247["domain_group_moid"], null)
  id = try(local.m1247["id"], null)
  is_shrinking = try(local.m1247["is_shrinking"], null)
  mod_time = try(local.m1247["mod_time"], null)
  moid = try(local.m1247["moid"], null)
  monitoring_mode = try(local.m1247["monitoring_mode"], null)
  monitoring_status = try(local.m1247["monitoring_status"], null)
  name = try(local.m1247["name"], null)
  object_type = try(local.m1247["object_type"], null)
  owners = try(local.m1247["owners"], null)
  pool_action_mode = try(local.m1247["pool_action_mode"], null)
  pool_id = try(local.m1247["pool_id"], null)
  progress_of_replacing = try(local.m1247["progress_of_replacing"], null)
  results = try(local.m1247["results"], null)
  shared_scope = try(local.m1247["shared_scope"], null)
  status = try(local.m1247["status"], null)
  total_reserved_capacity = try(local.m1247["total_reserved_capacity"], null)
  type = try(local.m1247["type"], null)
  warning_threshold = try(local.m1247["warning_threshold"], null)
  dynamic "ancestors" {
    for_each = try(local.m1247["ancestors"], null) == null ? [] : local.m1247["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1247["array"], null) == null ? [] : local.m1247["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1247["parent"], null) == null ? [] : local.m1247["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1247["permission_resources"], null) == null ? [] : local.m1247["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1247["registered_device"], null) == null ? [] : local.m1247["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1247["storage_utilization"], null) == null ? [] : local.m1247["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1247["tags"], null) == null ? [] : local.m1247["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1247["version_context"], null) == null ? [] : local.m1247["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
