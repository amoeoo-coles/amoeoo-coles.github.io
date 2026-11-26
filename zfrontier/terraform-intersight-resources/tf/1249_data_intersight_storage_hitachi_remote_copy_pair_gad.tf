# Sample data source intersight_storage_hitachi_remote_copy_pair_gad — reads ../models/data_intersight_storage_hitachi_remote_copy_pair_gad.yml
locals { m1249 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_remote_copy_pair_gad.yml"))["data_intersight_storage_hitachi_remote_copy_pair_gad"] }

data "intersight_storage_hitachi_remote_copy_pair_gad" "n1249" {
  account_moid = try(local.m1249["account_moid"], null)
  additional_properties = try(local.m1249["additional_properties"], null)
  class_id = try(local.m1249["class_id"], null)
  create_time = try(local.m1249["create_time"], null)
  created_local_time = try(local.m1249["created_local_time"], null)
  domain_group_moid = try(local.m1249["domain_group_moid"], null)
  id = try(local.m1249["id"], null)
  is_ssws = try(local.m1249["is_ssws"], null)
  mod_time = try(local.m1249["mod_time"], null)
  moid = try(local.m1249["moid"], null)
  mu_number = try(local.m1249["mu_number"], null)
  name = try(local.m1249["name"], null)
  object_type = try(local.m1249["object_type"], null)
  owners = try(local.m1249["owners"], null)
  pvol_ldev_id = try(local.m1249["pvol_ldev_id"], null)
  pvol_storage_serial = try(local.m1249["pvol_storage_serial"], null)
  quorum_disk_id = try(local.m1249["quorum_disk_id"], null)
  replication_type = try(local.m1249["replication_type"], null)
  results = try(local.m1249["results"], null)
  shared_scope = try(local.m1249["shared_scope"], null)
  status = try(local.m1249["status"], null)
  suspended_mode = try(local.m1249["suspended_mode"], null)
  svol_ldev_id = try(local.m1249["svol_ldev_id"], null)
  svol_storage_serial = try(local.m1249["svol_storage_serial"], null)
  dynamic "ancestors" {
    for_each = try(local.m1249["ancestors"], null) == null ? [] : local.m1249["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1249["array"], null) == null ? [] : local.m1249["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1249["parent"], null) == null ? [] : local.m1249["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1249["permission_resources"], null) == null ? [] : local.m1249["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1249["registered_device"], null) == null ? [] : local.m1249["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1249["tags"], null) == null ? [] : local.m1249["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1249["version_context"], null) == null ? [] : local.m1249["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
