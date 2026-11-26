# Sample data source intersight_storage_pure_quota_policy_rule — reads ../models/data_intersight_storage_pure_quota_policy_rule.yml
locals { m1337 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_quota_policy_rule.yml"))["data_intersight_storage_pure_quota_policy_rule"] }

data "intersight_storage_pure_quota_policy_rule" "n1337" {
  account_moid = try(local.m1337["account_moid"], null)
  additional_properties = try(local.m1337["additional_properties"], null)
  class_id = try(local.m1337["class_id"], null)
  create_time = try(local.m1337["create_time"], null)
  destroyed = try(local.m1337["destroyed"], null)
  domain_group_moid = try(local.m1337["domain_group_moid"], null)
  enforced = try(local.m1337["enforced"], null)
  id = try(local.m1337["id"], null)
  mod_time = try(local.m1337["mod_time"], null)
  moid = try(local.m1337["moid"], null)
  name = try(local.m1337["name"], null)
  notifications = try(local.m1337["notifications"], null)
  object_type = try(local.m1337["object_type"], null)
  owners = try(local.m1337["owners"], null)
  policy_name = try(local.m1337["policy_name"], null)
  quota_limit = try(local.m1337["quota_limit"], null)
  results = try(local.m1337["results"], null)
  shared_scope = try(local.m1337["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1337["ancestors"], null) == null ? [] : local.m1337["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1337["array"], null) == null ? [] : local.m1337["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1337["parent"], null) == null ? [] : local.m1337["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1337["permission_resources"], null) == null ? [] : local.m1337["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy" {
    for_each = try(local.m1337["policy"], null) == null ? [] : local.m1337["policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1337["registered_device"], null) == null ? [] : local.m1337["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1337["tags"], null) == null ? [] : local.m1337["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1337["version_context"], null) == null ? [] : local.m1337["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
