# Sample data source intersight_iam_user_group — reads ../models/data_intersight_iam_user_group.yml
locals { m742 = yamldecode(file("${path.module}/../models/data_intersight_iam_user_group.yml"))["data_intersight_iam_user_group"] }

data "intersight_iam_user_group" "n742" {
  access_activation_time = try(local.m742["access_activation_time"], null)
  access_expiry_time = try(local.m742["access_expiry_time"], null)
  access_link = try(local.m742["access_link"], null)
  account_moid = try(local.m742["account_moid"], null)
  additional_properties = try(local.m742["additional_properties"], null)
  class_id = try(local.m742["class_id"], null)
  create_time = try(local.m742["create_time"], null)
  domain_group_moid = try(local.m742["domain_group_moid"], null)
  dynamic_user_retention_days = try(local.m742["dynamic_user_retention_days"], null)
  group_type = try(local.m742["group_type"], null)
  id = try(local.m742["id"], null)
  instruction = try(local.m742["instruction"], null)
  mod_time = try(local.m742["mod_time"], null)
  moid = try(local.m742["moid"], null)
  name = try(local.m742["name"], null)
  object_type = try(local.m742["object_type"], null)
  owners = try(local.m742["owners"], null)
  results = try(local.m742["results"], null)
  shared_scope = try(local.m742["shared_scope"], null)
  unique_reference_id = try(local.m742["unique_reference_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m742["ancestors"], null) == null ? [] : local.m742["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp" {
    for_each = try(local.m742["idp"], null) == null ? [] : local.m742["idp"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idpreference" {
    for_each = try(local.m742["idpreference"], null) == null ? [] : local.m742["idpreference"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m742["parent"], null) == null ? [] : local.m742["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m742["permission_resources"], null) == null ? [] : local.m742["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permissions" {
    for_each = try(local.m742["permissions"], null) == null ? [] : local.m742["permissions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "qualifier" {
    for_each = try(local.m742["qualifier"], null) == null ? [] : local.m742["qualifier"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "routing_rules" {
    for_each = try(local.m742["routing_rules"], null) == null ? [] : local.m742["routing_rules"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m742["tags"], null) == null ? [] : local.m742["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user_group_memberships" {
    for_each = try(local.m742["user_group_memberships"], null) == null ? [] : local.m742["user_group_memberships"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "users" {
    for_each = try(local.m742["users"], null) == null ? [] : local.m742["users"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m742["version_context"], null) == null ? [] : local.m742["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
