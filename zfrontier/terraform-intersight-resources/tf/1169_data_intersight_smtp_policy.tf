# Sample data source intersight_smtp_policy — reads ../models/data_intersight_smtp_policy.yml
locals { m1169 = yamldecode(file("${path.module}/../models/data_intersight_smtp_policy.yml"))["data_intersight_smtp_policy"] }

data "intersight_smtp_policy" "n1169" {
  account_moid = try(local.m1169["account_moid"], null)
  additional_properties = try(local.m1169["additional_properties"], null)
  auth_password = try(var.secrets["data_intersight_smtp_policy.auth_password"], local.m1169["auth_password"])
  class_id = try(local.m1169["class_id"], null)
  create_time = try(local.m1169["create_time"], null)
  description = try(local.m1169["description"], null)
  domain_group_moid = try(local.m1169["domain_group_moid"], null)
  enable_auth = try(local.m1169["enable_auth"], null)
  enable_tls = try(local.m1169["enable_tls"], null)
  enabled = try(local.m1169["enabled"], null)
  id = try(local.m1169["id"], null)
  is_auth_password_set = try(var.secrets["data_intersight_smtp_policy.is_auth_password_set"], local.m1169["is_auth_password_set"])
  min_severity = try(local.m1169["min_severity"], null)
  mod_time = try(local.m1169["mod_time"], null)
  moid = try(local.m1169["moid"], null)
  name = try(local.m1169["name"], null)
  object_type = try(local.m1169["object_type"], null)
  owners = try(local.m1169["owners"], null)
  results = try(local.m1169["results"], null)
  sender_email = try(local.m1169["sender_email"], null)
  shared_scope = try(local.m1169["shared_scope"], null)
  smtp_port = try(local.m1169["smtp_port"], null)
  smtp_recipients = try(local.m1169["smtp_recipients"], null)
  smtp_server = try(local.m1169["smtp_server"], null)
  user_name = try(local.m1169["user_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1169["ancestors"], null) == null ? [] : local.m1169["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "appliance_account" {
    for_each = try(local.m1169["appliance_account"], null) == null ? [] : local.m1169["appliance_account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "certificate" {
    for_each = try(local.m1169["certificate"], null) == null ? [] : local.m1169["certificate"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1169["organization"], null) == null ? [] : local.m1169["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1169["parent"], null) == null ? [] : local.m1169["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1169["permission_resources"], null) == null ? [] : local.m1169["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m1169["profiles"], null) == null ? [] : local.m1169["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1169["tags"], null) == null ? [] : local.m1169["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1169["version_context"], null) == null ? [] : local.m1169["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
