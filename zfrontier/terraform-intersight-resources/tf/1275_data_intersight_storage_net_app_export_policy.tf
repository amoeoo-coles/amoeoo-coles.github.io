# Sample data source intersight_storage_net_app_export_policy — reads ../models/data_intersight_storage_net_app_export_policy.yml
locals { m1275 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_export_policy.yml"))["data_intersight_storage_net_app_export_policy"] }

data "intersight_storage_net_app_export_policy" "n1275" {
  account_moid = try(local.m1275["account_moid"], null)
  additional_properties = try(local.m1275["additional_properties"], null)
  class_id = try(local.m1275["class_id"], null)
  cluster_uuid = try(local.m1275["cluster_uuid"], null)
  create_time = try(local.m1275["create_time"], null)
  domain_group_moid = try(local.m1275["domain_group_moid"], null)
  id = try(local.m1275["id"], null)
  mod_time = try(local.m1275["mod_time"], null)
  moid = try(local.m1275["moid"], null)
  name = try(local.m1275["name"], null)
  object_type = try(local.m1275["object_type"], null)
  owners = try(local.m1275["owners"], null)
  policy_id = try(local.m1275["policy_id"], null)
  results = try(local.m1275["results"], null)
  shared_scope = try(local.m1275["shared_scope"], null)
  svm_name = try(local.m1275["svm_name"], null)
  uuid = try(local.m1275["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1275["ancestors"], null) == null ? [] : local.m1275["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1275["array"], null) == null ? [] : local.m1275["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "net_app_export_policy_rule" {
    for_each = try(local.m1275["net_app_export_policy_rule"], null) == null ? [] : local.m1275["net_app_export_policy_rule"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1275["parent"], null) == null ? [] : local.m1275["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1275["permission_resources"], null) == null ? [] : local.m1275["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1275["tags"], null) == null ? [] : local.m1275["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1275["tenant"], null) == null ? [] : local.m1275["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1275["version_context"], null) == null ? [] : local.m1275["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
