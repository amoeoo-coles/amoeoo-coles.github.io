# Sample data source intersight_iam_session — reads ../models/data_intersight_iam_session.yml
locals { m735 = yamldecode(file("${path.module}/../models/data_intersight_iam_session.yml"))["data_intersight_iam_session"] }

data "intersight_iam_session" "n735" {
  account_moid = try(local.m735["account_moid"], null)
  additional_properties = try(local.m735["additional_properties"], null)
  class_id = try(local.m735["class_id"], null)
  client_ip_address = try(local.m735["client_ip_address"], null)
  create_time = try(local.m735["create_time"], null)
  domain_group_moid = try(local.m735["domain_group_moid"], null)
  end_time = try(local.m735["end_time"], null)
  expiration = try(local.m735["expiration"], null)
  external_identifier = try(local.m735["external_identifier"], null)
  failed_logins = try(local.m735["failed_logins"], null)
  id = try(local.m735["id"], null)
  idle_time_expiration = try(local.m735["idle_time_expiration"], null)
  last_login_client = try(local.m735["last_login_client"], null)
  last_login_time = try(local.m735["last_login_time"], null)
  login_type = try(local.m735["login_type"], null)
  mod_time = try(local.m735["mod_time"], null)
  moid = try(local.m735["moid"], null)
  object_type = try(local.m735["object_type"], null)
  owners = try(local.m735["owners"], null)
  results = try(local.m735["results"], null)
  role = try(local.m735["role"], null)
  session_id = try(local.m735["session_id"], null)
  shared_scope = try(local.m735["shared_scope"], null)
  status = try(local.m735["status"], null)
  user_id_or_email = try(local.m735["user_id_or_email"], null)
  dynamic "account_permissions" {
    for_each = try(local.m735["account_permissions"], null) == null ? [] : local.m735["account_permissions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m735["ancestors"], null) == null ? [] : local.m735["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m735["parent"], null) == null ? [] : local.m735["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission" {
    for_each = try(local.m735["permission"], null) == null ? [] : local.m735["permission"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m735["permission_resources"], null) == null ? [] : local.m735["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scope" {
    for_each = try(local.m735["scope"], null) == null ? [] : local.m735["scope"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m735["tags"], null) == null ? [] : local.m735["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m735["user"], null) == null ? [] : local.m735["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m735["version_context"], null) == null ? [] : local.m735["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
