# Sample data source intersight_storage_hitachi_remote_copy_pair_tc — reads ../models/data_intersight_storage_hitachi_remote_copy_pair_tc.yml
locals { m1250 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_remote_copy_pair_tc.yml"))["data_intersight_storage_hitachi_remote_copy_pair_tc"] }

data "intersight_storage_hitachi_remote_copy_pair_tc" "n1250" {
  account_moid = try(local.m1250["account_moid"], null)
  additional_properties = try(local.m1250["additional_properties"], null)
  class_id = try(local.m1250["class_id"], null)
  create_time = try(local.m1250["create_time"], null)
  domain_group_moid = try(local.m1250["domain_group_moid"], null)
  id = try(local.m1250["id"], null)
  mod_time = try(local.m1250["mod_time"], null)
  moid = try(local.m1250["moid"], null)
  mu_number = try(local.m1250["mu_number"], null)
  name = try(local.m1250["name"], null)
  object_type = try(local.m1250["object_type"], null)
  owners = try(local.m1250["owners"], null)
  pvol_ldev_id = try(local.m1250["pvol_ldev_id"], null)
  pvol_storage_serial = try(local.m1250["pvol_storage_serial"], null)
  replication_type = try(local.m1250["replication_type"], null)
  results = try(local.m1250["results"], null)
  shared_scope = try(local.m1250["shared_scope"], null)
  status = try(local.m1250["status"], null)
  svol_ldev_id = try(local.m1250["svol_ldev_id"], null)
  svol_storage_serial = try(local.m1250["svol_storage_serial"], null)
  dynamic "ancestors" {
    for_each = try(local.m1250["ancestors"], null) == null ? [] : local.m1250["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1250["array"], null) == null ? [] : local.m1250["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1250["parent"], null) == null ? [] : local.m1250["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1250["permission_resources"], null) == null ? [] : local.m1250["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1250["registered_device"], null) == null ? [] : local.m1250["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1250["tags"], null) == null ? [] : local.m1250["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1250["version_context"], null) == null ? [] : local.m1250["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
