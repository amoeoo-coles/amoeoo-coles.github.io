# Sample data source intersight_storage_hitachi_remote_replication — reads ../models/data_intersight_storage_hitachi_remote_replication.yml
locals { m1252 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_remote_replication.yml"))["data_intersight_storage_hitachi_remote_replication"] }

data "intersight_storage_hitachi_remote_replication" "n1252" {
  account_moid = try(local.m1252["account_moid"], null)
  additional_properties = try(local.m1252["additional_properties"], null)
  class_id = try(local.m1252["class_id"], null)
  consistency_group_id = try(local.m1252["consistency_group_id"], null)
  copy_pace = try(local.m1252["copy_pace"], null)
  create_time = try(local.m1252["create_time"], null)
  delta_status = try(local.m1252["delta_status"], null)
  domain_group_moid = try(local.m1252["domain_group_moid"], null)
  fence_level = try(local.m1252["fence_level"], null)
  id = try(local.m1252["id"], null)
  mod_time = try(local.m1252["mod_time"], null)
  moid = try(local.m1252["moid"], null)
  mu_number = try(local.m1252["mu_number"], null)
  name = try(local.m1252["name"], null)
  object_type = try(local.m1252["object_type"], null)
  owners = try(local.m1252["owners"], null)
  path_group_id = try(local.m1252["path_group_id"], null)
  pvol_io_mode = try(local.m1252["pvol_io_mode"], null)
  pvol_journal_id = try(local.m1252["pvol_journal_id"], null)
  pvol_ldev_id = try(local.m1252["pvol_ldev_id"], null)
  pvol_storage_serial = try(local.m1252["pvol_storage_serial"], null)
  quorum_disk_id = try(local.m1252["quorum_disk_id"], null)
  replication_type = try(local.m1252["replication_type"], null)
  results = try(local.m1252["results"], null)
  shared_scope = try(local.m1252["shared_scope"], null)
  status = try(local.m1252["status"], null)
  svol_io_mode = try(local.m1252["svol_io_mode"], null)
  svol_journal_id = try(local.m1252["svol_journal_id"], null)
  svol_ldev_id = try(local.m1252["svol_ldev_id"], null)
  svol_storage_serial = try(local.m1252["svol_storage_serial"], null)
  dynamic "ancestors" {
    for_each = try(local.m1252["ancestors"], null) == null ? [] : local.m1252["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1252["array"], null) == null ? [] : local.m1252["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1252["parent"], null) == null ? [] : local.m1252["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1252["permission_resources"], null) == null ? [] : local.m1252["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1252["registered_device"], null) == null ? [] : local.m1252["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1252["tags"], null) == null ? [] : local.m1252["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1252["version_context"], null) == null ? [] : local.m1252["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
