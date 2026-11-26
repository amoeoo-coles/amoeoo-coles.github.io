# Sample data source intersight_iam_user — reads ../models/data_intersight_iam_user.yml
locals { m741 = yamldecode(file("${path.module}/../models/data_intersight_iam_user.yml"))["data_intersight_iam_user"] }

data "intersight_iam_user" "n741" {
  account_moid = try(local.m741["account_moid"], null)
  additional_properties = try(local.m741["additional_properties"], null)
  class_id = try(local.m741["class_id"], null)
  client_ip_address = try(local.m741["client_ip_address"], null)
  create_time = try(local.m741["create_time"], null)
  domain_group_moid = try(local.m741["domain_group_moid"], null)
  email = try(local.m741["email"], null)
  external_identifier = try(local.m741["external_identifier"], null)
  first_name = try(local.m741["first_name"], null)
  id = try(local.m741["id"], null)
  last_login_time = try(local.m741["last_login_time"], null)
  last_name = try(local.m741["last_name"], null)
  last_role_modified_time = try(local.m741["last_role_modified_time"], null)
  locked_until = try(local.m741["locked_until"], null)
  mod_time = try(local.m741["mod_time"], null)
  moid = try(local.m741["moid"], null)
  name = try(local.m741["name"], null)
  object_type = try(local.m741["object_type"], null)
  owners = try(local.m741["owners"], null)
  results = try(local.m741["results"], null)
  shared_scope = try(local.m741["shared_scope"], null)
  user_id_or_email = try(local.m741["user_id_or_email"], null)
  user_type = try(local.m741["user_type"], null)
  user_unique_identifier = try(local.m741["user_unique_identifier"], null)
  dynamic "ancestors" {
    for_each = try(local.m741["ancestors"], null) == null ? [] : local.m741["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "api_keys" {
    for_each = try(local.m741["api_keys"], null) == null ? [] : local.m741["api_keys"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "app_registrations" {
    for_each = try(local.m741["app_registrations"], null) == null ? [] : local.m741["app_registrations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp" {
    for_each = try(local.m741["idp"], null) == null ? [] : local.m741["idp"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idpreference" {
    for_each = try(local.m741["idpreference"], null) == null ? [] : local.m741["idpreference"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "local_user_password" {
    for_each = try(local.m741["local_user_password"], null) == null ? [] : local.m741["local_user_password"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "oauth_tokens" {
    for_each = try(local.m741["oauth_tokens"], null) == null ? [] : local.m741["oauth_tokens"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m741["parent"], null) == null ? [] : local.m741["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m741["permission_resources"], null) == null ? [] : local.m741["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permissions" {
    for_each = try(local.m741["permissions"], null) == null ? [] : local.m741["permissions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sessions" {
    for_each = try(local.m741["sessions"], null) == null ? [] : local.m741["sessions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m741["tags"], null) == null ? [] : local.m741["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user_group_memberships" {
    for_each = try(local.m741["user_group_memberships"], null) == null ? [] : local.m741["user_group_memberships"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "usergroup" {
    for_each = try(local.m741["usergroup"], null) == null ? [] : local.m741["usergroup"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m741["version_context"], null) == null ? [] : local.m741["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
