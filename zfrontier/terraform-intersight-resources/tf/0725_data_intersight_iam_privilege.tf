# Sample data source intersight_iam_privilege — reads ../models/data_intersight_iam_privilege.yml
locals { m725 = yamldecode(file("${path.module}/../models/data_intersight_iam_privilege.yml"))["data_intersight_iam_privilege"] }

data "intersight_iam_privilege" "n725" {
  account_moid = try(local.m725["account_moid"], null)
  additional_properties = try(local.m725["additional_properties"], null)
  attribute_names = try(local.m725["attribute_names"], null)
  class_id = try(local.m725["class_id"], null)
  condition = try(local.m725["condition"], null)
  create_time = try(local.m725["create_time"], null)
  description = try(local.m725["description"], null)
  domain_group_moid = try(local.m725["domain_group_moid"], null)
  hostname_prefix = try(local.m725["hostname_prefix"], null)
  id = try(local.m725["id"], null)
  is_conditional_privilege = try(local.m725["is_conditional_privilege"], null)
  method = try(local.m725["method"], null)
  mod_time = try(local.m725["mod_time"], null)
  moid = try(local.m725["moid"], null)
  name = try(local.m725["name"], null)
  object_type = try(local.m725["object_type"], null)
  owners = try(local.m725["owners"], null)
  rest_path = try(local.m725["rest_path"], null)
  results = try(local.m725["results"], null)
  shared_scope = try(local.m725["shared_scope"], null)
  url_prefix = try(local.m725["url_prefix"], null)
  dynamic "account" {
    for_each = try(local.m725["account"], null) == null ? [] : local.m725["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m725["ancestors"], null) == null ? [] : local.m725["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m725["parent"], null) == null ? [] : local.m725["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m725["permission_resources"], null) == null ? [] : local.m725["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system" {
    for_each = try(local.m725["system"], null) == null ? [] : local.m725["system"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m725["tags"], null) == null ? [] : local.m725["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m725["version_context"], null) == null ? [] : local.m725["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
