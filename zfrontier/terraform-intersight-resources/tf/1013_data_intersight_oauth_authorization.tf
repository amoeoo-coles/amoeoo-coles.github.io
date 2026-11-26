# Sample data source intersight_oauth_authorization — reads ../models/data_intersight_oauth_authorization.yml
locals { m1013 = yamldecode(file("${path.module}/../models/data_intersight_oauth_authorization.yml"))["data_intersight_oauth_authorization"] }

data "intersight_oauth_authorization" "n1013" {
  account_moid = try(local.m1013["account_moid"], null)
  additional_properties = try(local.m1013["additional_properties"], null)
  api_type = try(local.m1013["api_type"], null)
  class_id = try(local.m1013["class_id"], null)
  create_time = try(local.m1013["create_time"], null)
  domain_group_moid = try(local.m1013["domain_group_moid"], null)
  id = try(local.m1013["id"], null)
  is_password_set = try(var.secrets["data_intersight_oauth_authorization.is_password_set"], local.m1013["is_password_set"])
  is_user_id_set = try(local.m1013["is_user_id_set"], null)
  mod_time = try(local.m1013["mod_time"], null)
  moid = try(local.m1013["moid"], null)
  object_type = try(local.m1013["object_type"], null)
  owners = try(local.m1013["owners"], null)
  password = try(var.secrets["data_intersight_oauth_authorization.password"], local.m1013["password"])
  results = try(local.m1013["results"], null)
  shared_scope = try(local.m1013["shared_scope"], null)
  user_id = try(local.m1013["user_id"], null)
  dynamic "access_token" {
    for_each = try(local.m1013["access_token"], null) == null ? [] : local.m1013["access_token"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "account" {
    for_each = try(local.m1013["account"], null) == null ? [] : local.m1013["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1013["ancestors"], null) == null ? [] : local.m1013["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1013["parent"], null) == null ? [] : local.m1013["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1013["permission_resources"], null) == null ? [] : local.m1013["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1013["tags"], null) == null ? [] : local.m1013["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1013["version_context"], null) == null ? [] : local.m1013["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
