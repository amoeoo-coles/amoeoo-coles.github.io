# Sample data source intersight_storage_net_app_qtree — reads ../models/data_intersight_storage_net_app_qtree.yml
locals { m1297 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_qtree.yml"))["data_intersight_storage_net_app_qtree"] }

data "intersight_storage_net_app_qtree" "n1297" {
  account_moid = try(local.m1297["account_moid"], null)
  additional_properties = try(local.m1297["additional_properties"], null)
  class_id = try(local.m1297["class_id"], null)
  create_time = try(local.m1297["create_time"], null)
  domain_group_moid = try(local.m1297["domain_group_moid"], null)
  export_policy_id = try(local.m1297["export_policy_id"], null)
  id = try(local.m1297["id"], null)
  mod_time = try(local.m1297["mod_time"], null)
  moid = try(local.m1297["moid"], null)
  name = try(local.m1297["name"], null)
  object_type = try(local.m1297["object_type"], null)
  owners = try(local.m1297["owners"], null)
  path = try(local.m1297["path"], null)
  permission = try(local.m1297["permission"], null)
  qtree_id = try(local.m1297["qtree_id"], null)
  results = try(local.m1297["results"], null)
  security_style = try(local.m1297["security_style"], null)
  shared_scope = try(local.m1297["shared_scope"], null)
  svm_name = try(local.m1297["svm_name"], null)
  volume_name = try(local.m1297["volume_name"], null)
  volume_uuid = try(local.m1297["volume_uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1297["ancestors"], null) == null ? [] : local.m1297["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1297["parent"], null) == null ? [] : local.m1297["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1297["permission_resources"], null) == null ? [] : local.m1297["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_container" {
    for_each = try(local.m1297["storage_container"], null) == null ? [] : local.m1297["storage_container"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1297["tags"], null) == null ? [] : local.m1297["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1297["tenant"], null) == null ? [] : local.m1297["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1297["version_context"], null) == null ? [] : local.m1297["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
