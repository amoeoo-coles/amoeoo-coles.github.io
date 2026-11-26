# Sample data source intersight_storage_net_app_svm_snapshot_policy — reads ../models/data_intersight_storage_net_app_svm_snapshot_policy.yml
locals { m1304 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_svm_snapshot_policy.yml"))["data_intersight_storage_net_app_svm_snapshot_policy"] }

data "intersight_storage_net_app_svm_snapshot_policy" "n1304" {
  account_moid = try(local.m1304["account_moid"], null)
  additional_properties = try(local.m1304["additional_properties"], null)
  class_id = try(local.m1304["class_id"], null)
  create_time = try(local.m1304["create_time"], null)
  domain_group_moid = try(local.m1304["domain_group_moid"], null)
  enabled = try(local.m1304["enabled"], null)
  id = try(local.m1304["id"], null)
  mod_time = try(local.m1304["mod_time"], null)
  moid = try(local.m1304["moid"], null)
  name = try(local.m1304["name"], null)
  object_type = try(local.m1304["object_type"], null)
  owners = try(local.m1304["owners"], null)
  results = try(local.m1304["results"], null)
  scope = try(local.m1304["scope"], null)
  shared_scope = try(local.m1304["shared_scope"], null)
  svm_name = try(local.m1304["svm_name"], null)
  uuid = try(local.m1304["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1304["ancestors"], null) == null ? [] : local.m1304["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "copies" {
    for_each = try(local.m1304["copies"], null) == null ? [] : local.m1304["copies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1304["parent"], null) == null ? [] : local.m1304["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1304["permission_resources"], null) == null ? [] : local.m1304["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1304["tags"], null) == null ? [] : local.m1304["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1304["tenant"], null) == null ? [] : local.m1304["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1304["version_context"], null) == null ? [] : local.m1304["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
