# Sample data source intersight_smtp_policy_inventory — reads ../models/data_intersight_smtp_policy_inventory.yml
locals { m1170 = yamldecode(file("${path.module}/../models/data_intersight_smtp_policy_inventory.yml"))["data_intersight_smtp_policy_inventory"] }

data "intersight_smtp_policy_inventory" "n1170" {
  account_moid = try(local.m1170["account_moid"], null)
  additional_properties = try(local.m1170["additional_properties"], null)
  auth_password = try(var.secrets["data_intersight_smtp_policy_inventory.auth_password"], local.m1170["auth_password"])
  class_id = try(local.m1170["class_id"], null)
  create_time = try(local.m1170["create_time"], null)
  description = try(local.m1170["description"], null)
  device_mo_id = try(local.m1170["device_mo_id"], null)
  domain_group_moid = try(local.m1170["domain_group_moid"], null)
  enable_auth = try(local.m1170["enable_auth"], null)
  enable_tls = try(local.m1170["enable_tls"], null)
  enabled = try(local.m1170["enabled"], null)
  id = try(local.m1170["id"], null)
  is_auth_password_set = try(var.secrets["data_intersight_smtp_policy_inventory.is_auth_password_set"], local.m1170["is_auth_password_set"])
  min_severity = try(local.m1170["min_severity"], null)
  mod_time = try(local.m1170["mod_time"], null)
  moid = try(local.m1170["moid"], null)
  name = try(local.m1170["name"], null)
  object_type = try(local.m1170["object_type"], null)
  owners = try(local.m1170["owners"], null)
  results = try(local.m1170["results"], null)
  sender_email = try(local.m1170["sender_email"], null)
  shared_scope = try(local.m1170["shared_scope"], null)
  smtp_port = try(local.m1170["smtp_port"], null)
  smtp_recipients = try(local.m1170["smtp_recipients"], null)
  smtp_server = try(local.m1170["smtp_server"], null)
  user_name = try(local.m1170["user_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1170["ancestors"], null) == null ? [] : local.m1170["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "certificate" {
    for_each = try(local.m1170["certificate"], null) == null ? [] : local.m1170["certificate"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1170["parent"], null) == null ? [] : local.m1170["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1170["permission_resources"], null) == null ? [] : local.m1170["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1170["tags"], null) == null ? [] : local.m1170["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1170["target_mo"], null) == null ? [] : local.m1170["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1170["version_context"], null) == null ? [] : local.m1170["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
