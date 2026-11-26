# Sample data source intersight_storage_hitachi_remote_copy_pair_ur — reads ../models/data_intersight_storage_hitachi_remote_copy_pair_ur.yml
locals { m1251 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_remote_copy_pair_ur.yml"))["data_intersight_storage_hitachi_remote_copy_pair_ur"] }

data "intersight_storage_hitachi_remote_copy_pair_ur" "n1251" {
  account_moid = try(local.m1251["account_moid"], null)
  additional_properties = try(local.m1251["additional_properties"], null)
  class_id = try(local.m1251["class_id"], null)
  create_time = try(local.m1251["create_time"], null)
  domain_group_moid = try(local.m1251["domain_group_moid"], null)
  id = try(local.m1251["id"], null)
  mod_time = try(local.m1251["mod_time"], null)
  moid = try(local.m1251["moid"], null)
  mu_number = try(local.m1251["mu_number"], null)
  name = try(local.m1251["name"], null)
  object_type = try(local.m1251["object_type"], null)
  owners = try(local.m1251["owners"], null)
  pvol_ldev_id = try(local.m1251["pvol_ldev_id"], null)
  pvol_storage_serial = try(local.m1251["pvol_storage_serial"], null)
  replication_type = try(local.m1251["replication_type"], null)
  results = try(local.m1251["results"], null)
  shared_scope = try(local.m1251["shared_scope"], null)
  status = try(local.m1251["status"], null)
  svol_ldev_id = try(local.m1251["svol_ldev_id"], null)
  svol_storage_serial = try(local.m1251["svol_storage_serial"], null)
  dynamic "ancestors" {
    for_each = try(local.m1251["ancestors"], null) == null ? [] : local.m1251["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1251["array"], null) == null ? [] : local.m1251["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1251["parent"], null) == null ? [] : local.m1251["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1251["permission_resources"], null) == null ? [] : local.m1251["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1251["registered_device"], null) == null ? [] : local.m1251["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1251["tags"], null) == null ? [] : local.m1251["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1251["version_context"], null) == null ? [] : local.m1251["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
