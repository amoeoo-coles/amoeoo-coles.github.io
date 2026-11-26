# Sample data source intersight_storage_hitachi_snapshot — reads ../models/data_intersight_storage_hitachi_snapshot.yml
locals { m1253 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_snapshot.yml"))["data_intersight_storage_hitachi_snapshot"] }

data "intersight_storage_hitachi_snapshot" "n1253" {
  account_moid = try(local.m1253["account_moid"], null)
  additional_properties = try(local.m1253["additional_properties"], null)
  class_id = try(local.m1253["class_id"], null)
  concordance_rate = try(local.m1253["concordance_rate"], null)
  create_time = try(local.m1253["create_time"], null)
  domain_group_moid = try(local.m1253["domain_group_moid"], null)
  id = try(local.m1253["id"], null)
  is_consistency_group = try(local.m1253["is_consistency_group"], null)
  is_multistageable = try(local.m1253["is_multistageable"], null)
  is_redirect_on_write = try(local.m1253["is_redirect_on_write"], null)
  mod_time = try(local.m1253["mod_time"], null)
  moid = try(local.m1253["moid"], null)
  mu_number = try(local.m1253["mu_number"], null)
  name = try(local.m1253["name"], null)
  object_type = try(local.m1253["object_type"], null)
  owners = try(local.m1253["owners"], null)
  pvol_ldev_id = try(local.m1253["pvol_ldev_id"], null)
  results = try(local.m1253["results"], null)
  shared_scope = try(local.m1253["shared_scope"], null)
  snapshot_group_name = try(local.m1253["snapshot_group_name"], null)
  snapshot_pool_id = try(local.m1253["snapshot_pool_id"], null)
  split_time = try(local.m1253["split_time"], null)
  status = try(local.m1253["status"], null)
  svol_ldev_id = try(local.m1253["svol_ldev_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1253["ancestors"], null) == null ? [] : local.m1253["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1253["array"], null) == null ? [] : local.m1253["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1253["parent"], null) == null ? [] : local.m1253["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1253["permission_resources"], null) == null ? [] : local.m1253["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1253["registered_device"], null) == null ? [] : local.m1253["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1253["tags"], null) == null ? [] : local.m1253["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1253["version_context"], null) == null ? [] : local.m1253["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
