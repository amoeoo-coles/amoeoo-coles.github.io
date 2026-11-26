# Sample data source intersight_iam_o_auth_token — reads ../models/data_intersight_iam_o_auth_token.yml
locals { m721 = yamldecode(file("${path.module}/../models/data_intersight_iam_o_auth_token.yml"))["data_intersight_iam_o_auth_token"] }

data "intersight_iam_o_auth_token" "n721" {
  access_expiration_time = try(local.m721["access_expiration_time"], null)
  account_moid = try(local.m721["account_moid"], null)
  additional_properties = try(local.m721["additional_properties"], null)
  class_id = try(local.m721["class_id"], null)
  client_id = try(local.m721["client_id"], null)
  client_ip_address = try(local.m721["client_ip_address"], null)
  client_name = try(local.m721["client_name"], null)
  create_time = try(local.m721["create_time"], null)
  domain_group_moid = try(local.m721["domain_group_moid"], null)
  expiration_time = try(local.m721["expiration_time"], null)
  id = try(local.m721["id"], null)
  last_login_client = try(local.m721["last_login_client"], null)
  last_login_time = try(local.m721["last_login_time"], null)
  mod_time = try(local.m721["mod_time"], null)
  moid = try(local.m721["moid"], null)
  object_type = try(local.m721["object_type"], null)
  owners = try(local.m721["owners"], null)
  results = try(local.m721["results"], null)
  shared_scope = try(local.m721["shared_scope"], null)
  token_id = try(local.m721["token_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m721["ancestors"], null) == null ? [] : local.m721["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "app_registration" {
    for_each = try(local.m721["app_registration"], null) == null ? [] : local.m721["app_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m721["parent"], null) == null ? [] : local.m721["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission" {
    for_each = try(local.m721["permission"], null) == null ? [] : local.m721["permission"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m721["permission_resources"], null) == null ? [] : local.m721["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m721["tags"], null) == null ? [] : local.m721["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m721["user"], null) == null ? [] : local.m721["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user_meta" {
    for_each = try(local.m721["user_meta"], null) == null ? [] : local.m721["user_meta"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m721["version_context"], null) == null ? [] : local.m721["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
