# Sample data source intersight_auditd_policy — reads ../models/data_intersight_auditd_policy.yml
locals { m103 = yamldecode(file("${path.module}/../models/data_intersight_auditd_policy.yml"))["data_intersight_auditd_policy"] }

data "intersight_auditd_policy" "n103" {
  account_moid = try(local.m103["account_moid"], null)
  additional_properties = try(local.m103["additional_properties"], null)
  admin_state = try(local.m103["admin_state"], null)
  auditd_log_level = try(local.m103["auditd_log_level"], null)
  class_id = try(local.m103["class_id"], null)
  create_time = try(local.m103["create_time"], null)
  description = try(local.m103["description"], null)
  domain_group_moid = try(local.m103["domain_group_moid"], null)
  id = try(local.m103["id"], null)
  mod_time = try(local.m103["mod_time"], null)
  moid = try(local.m103["moid"], null)
  name = try(local.m103["name"], null)
  object_type = try(local.m103["object_type"], null)
  owners = try(local.m103["owners"], null)
  results = try(local.m103["results"], null)
  shared_scope = try(local.m103["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m103["ancestors"], null) == null ? [] : local.m103["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "log_monitor" {
    for_each = try(local.m103["log_monitor"], null) == null ? [] : local.m103["log_monitor"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m103["organization"], null) == null ? [] : local.m103["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m103["parent"], null) == null ? [] : local.m103["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m103["permission_resources"], null) == null ? [] : local.m103["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m103["profiles"], null) == null ? [] : local.m103["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m103["tags"], null) == null ? [] : local.m103["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m103["version_context"], null) == null ? [] : local.m103["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
