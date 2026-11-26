# Sample data source intersight_oauth_access_token — reads ../models/data_intersight_oauth_access_token.yml
locals { m1012 = yamldecode(file("${path.module}/../models/data_intersight_oauth_access_token.yml"))["data_intersight_oauth_access_token"] }

data "intersight_oauth_access_token" "n1012" {
  account_moid = try(local.m1012["account_moid"], null)
  additional_properties = try(local.m1012["additional_properties"], null)
  api_type = try(local.m1012["api_type"], null)
  class_id = try(local.m1012["class_id"], null)
  create_time = try(local.m1012["create_time"], null)
  domain_group_moid = try(local.m1012["domain_group_moid"], null)
  expiry = try(local.m1012["expiry"], null)
  id = try(local.m1012["id"], null)
  is_encrypted_refresh_token_set = try(var.secrets["data_intersight_oauth_access_token.is_encrypted_refresh_token_set"], local.m1012["is_encrypted_refresh_token_set"])
  is_encrypted_token_set = try(var.secrets["data_intersight_oauth_access_token.is_encrypted_token_set"], local.m1012["is_encrypted_token_set"])
  issuer = try(local.m1012["issuer"], null)
  mod_time = try(local.m1012["mod_time"], null)
  moid = try(local.m1012["moid"], null)
  object_type = try(local.m1012["object_type"], null)
  owners = try(local.m1012["owners"], null)
  refresh_expiry = try(local.m1012["refresh_expiry"], null)
  results = try(local.m1012["results"], null)
  shared_scope = try(local.m1012["shared_scope"], null)
  token_owner = try(var.secrets["data_intersight_oauth_access_token.token_owner"], local.m1012["token_owner"])
  dynamic "account" {
    for_each = try(local.m1012["account"], null) == null ? [] : local.m1012["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1012["ancestors"], null) == null ? [] : local.m1012["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1012["parent"], null) == null ? [] : local.m1012["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1012["permission_resources"], null) == null ? [] : local.m1012["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1012["tags"], null) == null ? [] : local.m1012["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1012["version_context"], null) == null ? [] : local.m1012["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
