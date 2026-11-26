# Sample data source intersight_storage_pure_nfs_policy_rule — reads ../models/data_intersight_storage_pure_nfs_policy_rule.yml
locals { m1329 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_nfs_policy_rule.yml"))["data_intersight_storage_pure_nfs_policy_rule"] }

data "intersight_storage_pure_nfs_policy_rule" "n1329" {
  access = try(local.m1329["access"], null)
  account_moid = try(local.m1329["account_moid"], null)
  additional_properties = try(local.m1329["additional_properties"], null)
  anongid = try(local.m1329["anongid"], null)
  anonuid = try(local.m1329["anonuid"], null)
  class_id = try(local.m1329["class_id"], null)
  client = try(local.m1329["client"], null)
  create_time = try(local.m1329["create_time"], null)
  destroyed = try(local.m1329["destroyed"], null)
  domain_group_moid = try(local.m1329["domain_group_moid"], null)
  id = try(local.m1329["id"], null)
  mod_time = try(local.m1329["mod_time"], null)
  moid = try(local.m1329["moid"], null)
  name = try(local.m1329["name"], null)
  nfs_version = try(local.m1329["nfs_version"], null)
  object_type = try(local.m1329["object_type"], null)
  owners = try(local.m1329["owners"], null)
  permission = try(local.m1329["permission"], null)
  policy_name = try(local.m1329["policy_name"], null)
  results = try(local.m1329["results"], null)
  security = try(local.m1329["security"], null)
  shared_scope = try(local.m1329["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1329["ancestors"], null) == null ? [] : local.m1329["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1329["array"], null) == null ? [] : local.m1329["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1329["parent"], null) == null ? [] : local.m1329["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1329["permission_resources"], null) == null ? [] : local.m1329["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy" {
    for_each = try(local.m1329["policy"], null) == null ? [] : local.m1329["policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1329["registered_device"], null) == null ? [] : local.m1329["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1329["tags"], null) == null ? [] : local.m1329["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1329["version_context"], null) == null ? [] : local.m1329["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
