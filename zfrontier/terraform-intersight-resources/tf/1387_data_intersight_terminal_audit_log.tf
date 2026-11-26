# Sample data source intersight_terminal_audit_log — reads ../models/data_intersight_terminal_audit_log.yml
locals { m1387 = yamldecode(file("${path.module}/../models/data_intersight_terminal_audit_log.yml"))["data_intersight_terminal_audit_log"] }

data "intersight_terminal_audit_log" "n1387" {
  account_moid = try(local.m1387["account_moid"], null)
  additional_properties = try(local.m1387["additional_properties"], null)
  class_id = try(local.m1387["class_id"], null)
  create_time = try(local.m1387["create_time"], null)
  domain_group_moid = try(local.m1387["domain_group_moid"], null)
  end_time = try(local.m1387["end_time"], null)
  id = try(local.m1387["id"], null)
  mod_time = try(local.m1387["mod_time"], null)
  moid = try(local.m1387["moid"], null)
  object_type = try(local.m1387["object_type"], null)
  owners = try(local.m1387["owners"], null)
  results = try(local.m1387["results"], null)
  shared_scope = try(local.m1387["shared_scope"], null)
  start_time = try(local.m1387["start_time"], null)
  dynamic "ancestors" {
    for_each = try(local.m1387["ancestors"], null) == null ? [] : local.m1387["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_registration" {
    for_each = try(local.m1387["device_registration"], null) == null ? [] : local.m1387["device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1387["parent"], null) == null ? [] : local.m1387["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1387["permission_resources"], null) == null ? [] : local.m1387["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1387["tags"], null) == null ? [] : local.m1387["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m1387["user"], null) == null ? [] : local.m1387["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1387["version_context"], null) == null ? [] : local.m1387["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
