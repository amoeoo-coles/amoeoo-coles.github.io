# Sample data source intersight_iam_app_registration — reads ../models/data_intersight_iam_app_registration.yml
locals { m690 = yamldecode(file("${path.module}/../models/data_intersight_iam_app_registration.yml"))["data_intersight_iam_app_registration"] }

data "intersight_iam_app_registration" "n690" {
  account_moid = try(local.m690["account_moid"], null)
  additional_properties = try(local.m690["additional_properties"], null)
  admin_status = try(local.m690["admin_status"], null)
  class_id = try(local.m690["class_id"], null)
  client_id = try(local.m690["client_id"], null)
  client_name = try(local.m690["client_name"], null)
  client_secret = try(var.secrets["data_intersight_iam_app_registration.client_secret"], local.m690["client_secret"])
  client_type = try(local.m690["client_type"], null)
  create_time = try(local.m690["create_time"], null)
  description = try(local.m690["description"], null)
  domain_group_moid = try(local.m690["domain_group_moid"], null)
  entity_id = try(local.m690["entity_id"], null)
  expiry_date_time = try(local.m690["expiry_date_time"], null)
  grant_types = try(local.m690["grant_types"], null)
  id = try(local.m690["id"], null)
  is_never_expiring = try(local.m690["is_never_expiring"], null)
  last_used_ip = try(local.m690["last_used_ip"], null)
  last_used_time = try(local.m690["last_used_time"], null)
  mod_time = try(local.m690["mod_time"], null)
  moid = try(local.m690["moid"], null)
  object_type = try(local.m690["object_type"], null)
  oper_status = try(local.m690["oper_status"], null)
  owners = try(local.m690["owners"], null)
  redirect_uris = try(local.m690["redirect_uris"], null)
  renew_client_secret = try(var.secrets["data_intersight_iam_app_registration.renew_client_secret"], local.m690["renew_client_secret"])
  response_types = try(local.m690["response_types"], null)
  results = try(local.m690["results"], null)
  revocation_timestamp = try(local.m690["revocation_timestamp"], null)
  revoke = try(local.m690["revoke"], null)
  shared_scope = try(local.m690["shared_scope"], null)
  show_consent_screen = try(local.m690["show_consent_screen"], null)
  start_time = try(local.m690["start_time"], null)
  token_expiry = try(local.m690["token_expiry"], null)
  dynamic "account" {
    for_each = try(local.m690["account"], null) == null ? [] : local.m690["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m690["ancestors"], null) == null ? [] : local.m690["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "oauth_tokens" {
    for_each = try(local.m690["oauth_tokens"], null) == null ? [] : local.m690["oauth_tokens"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m690["parent"], null) == null ? [] : local.m690["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission" {
    for_each = try(local.m690["permission"], null) == null ? [] : local.m690["permission"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m690["permission_resources"], null) == null ? [] : local.m690["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "roles" {
    for_each = try(local.m690["roles"], null) == null ? [] : local.m690["roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scope" {
    for_each = try(local.m690["scope"], null) == null ? [] : local.m690["scope"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "security_holder" {
    for_each = try(local.m690["security_holder"], null) == null ? [] : local.m690["security_holder"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m690["tags"], null) == null ? [] : local.m690["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m690["user"], null) == null ? [] : local.m690["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m690["version_context"], null) == null ? [] : local.m690["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
