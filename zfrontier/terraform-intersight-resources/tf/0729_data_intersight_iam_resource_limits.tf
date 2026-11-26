# Sample data source intersight_iam_resource_limits — reads ../models/data_intersight_iam_resource_limits.yml
locals { m729 = yamldecode(file("${path.module}/../models/data_intersight_iam_resource_limits.yml"))["data_intersight_iam_resource_limits"] }

data "intersight_iam_resource_limits" "n729" {
  account_moid = try(local.m729["account_moid"], null)
  additional_properties = try(local.m729["additional_properties"], null)
  allow_api_keys_without_expiry = try(local.m729["allow_api_keys_without_expiry"], null)
  allow_app_registrations_without_expiry = try(local.m729["allow_app_registrations_without_expiry"], null)
  class_id = try(local.m729["class_id"], null)
  create_time = try(local.m729["create_time"], null)
  domain_group_moid = try(local.m729["domain_group_moid"], null)
  id = try(local.m729["id"], null)
  max_api_key_expiry = try(local.m729["max_api_key_expiry"], null)
  max_app_registration_expiry = try(local.m729["max_app_registration_expiry"], null)
  mod_time = try(local.m729["mod_time"], null)
  moid = try(local.m729["moid"], null)
  object_type = try(local.m729["object_type"], null)
  owners = try(local.m729["owners"], null)
  per_account_user_limit = try(local.m729["per_account_user_limit"], null)
  results = try(local.m729["results"], null)
  shared_scope = try(local.m729["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m729["account"], null) == null ? [] : local.m729["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m729["ancestors"], null) == null ? [] : local.m729["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m729["parent"], null) == null ? [] : local.m729["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m729["permission_resources"], null) == null ? [] : local.m729["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m729["tags"], null) == null ? [] : local.m729["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m729["version_context"], null) == null ? [] : local.m729["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
