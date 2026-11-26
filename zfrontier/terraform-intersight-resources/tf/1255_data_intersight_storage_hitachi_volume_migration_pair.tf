# Sample data source intersight_storage_hitachi_volume_migration_pair — reads ../models/data_intersight_storage_hitachi_volume_migration_pair.yml
locals { m1255 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_volume_migration_pair.yml"))["data_intersight_storage_hitachi_volume_migration_pair"] }

data "intersight_storage_hitachi_volume_migration_pair" "n1255" {
  account_moid = try(local.m1255["account_moid"], null)
  additional_properties = try(local.m1255["additional_properties"], null)
  class_id = try(local.m1255["class_id"], null)
  copy_mode = try(local.m1255["copy_mode"], null)
  create_time = try(local.m1255["create_time"], null)
  domain_group_moid = try(local.m1255["domain_group_moid"], null)
  id = try(local.m1255["id"], null)
  local_clone_copypair_id = try(local.m1255["local_clone_copypair_id"], null)
  mod_time = try(local.m1255["mod_time"], null)
  moid = try(local.m1255["moid"], null)
  object_type = try(local.m1255["object_type"], null)
  owners = try(local.m1255["owners"], null)
  pvol_ldev_id = try(local.m1255["pvol_ldev_id"], null)
  pvol_status = try(local.m1255["pvol_status"], null)
  results = try(local.m1255["results"], null)
  shared_scope = try(local.m1255["shared_scope"], null)
  svol_ldev_id = try(local.m1255["svol_ldev_id"], null)
  svol_status = try(local.m1255["svol_status"], null)
  dynamic "ancestors" {
    for_each = try(local.m1255["ancestors"], null) == null ? [] : local.m1255["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1255["array"], null) == null ? [] : local.m1255["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1255["parent"], null) == null ? [] : local.m1255["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1255["permission_resources"], null) == null ? [] : local.m1255["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1255["registered_device"], null) == null ? [] : local.m1255["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1255["tags"], null) == null ? [] : local.m1255["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1255["version_context"], null) == null ? [] : local.m1255["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
