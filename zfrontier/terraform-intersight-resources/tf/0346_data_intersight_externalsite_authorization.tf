# Sample data source intersight_externalsite_authorization — reads ../models/data_intersight_externalsite_authorization.yml
locals { m346 = yamldecode(file("${path.module}/../models/data_intersight_externalsite_authorization.yml"))["data_intersight_externalsite_authorization"] }

data "intersight_externalsite_authorization" "n346" {
  account_moid = try(local.m346["account_moid"], null)
  additional_properties = try(local.m346["additional_properties"], null)
  class_id = try(local.m346["class_id"], null)
  create_time = try(local.m346["create_time"], null)
  domain_group_moid = try(local.m346["domain_group_moid"], null)
  id = try(local.m346["id"], null)
  is_password_set = try(var.secrets["data_intersight_externalsite_authorization.is_password_set"], local.m346["is_password_set"])
  is_user_id_set = try(local.m346["is_user_id_set"], null)
  mod_time = try(local.m346["mod_time"], null)
  moid = try(local.m346["moid"], null)
  object_type = try(local.m346["object_type"], null)
  owners = try(local.m346["owners"], null)
  password = try(var.secrets["data_intersight_externalsite_authorization.password"], local.m346["password"])
  repository_type = try(local.m346["repository_type"], null)
  results = try(local.m346["results"], null)
  shared_scope = try(local.m346["shared_scope"], null)
  user_id = try(local.m346["user_id"], null)
  dynamic "account" {
    for_each = try(local.m346["account"], null) == null ? [] : local.m346["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m346["ancestors"], null) == null ? [] : local.m346["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m346["parent"], null) == null ? [] : local.m346["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m346["permission_resources"], null) == null ? [] : local.m346["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m346["tags"], null) == null ? [] : local.m346["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m346["version_context"], null) == null ? [] : local.m346["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
