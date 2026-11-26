# Sample data source intersight_cond_alarm_suppression — reads ../models/data_intersight_cond_alarm_suppression.yml
locals { m265 = yamldecode(file("${path.module}/../models/data_intersight_cond_alarm_suppression.yml"))["data_intersight_cond_alarm_suppression"] }

data "intersight_cond_alarm_suppression" "n265" {
  account_moid = try(local.m265["account_moid"], null)
  additional_properties = try(local.m265["additional_properties"], null)
  class_id = try(local.m265["class_id"], null)
  create_time = try(local.m265["create_time"], null)
  description = try(local.m265["description"], null)
  domain_group_moid = try(local.m265["domain_group_moid"], null)
  enabled = try(local.m265["enabled"], null)
  end_date = try(local.m265["end_date"], null)
  id = try(local.m265["id"], null)
  mod_time = try(local.m265["mod_time"], null)
  moid = try(local.m265["moid"], null)
  name = try(local.m265["name"], null)
  object_type = try(local.m265["object_type"], null)
  odata_filter_internal = try(local.m265["odata_filter_internal"], null)
  owners = try(local.m265["owners"], null)
  results = try(local.m265["results"], null)
  rules_operator = try(local.m265["rules_operator"], null)
  shared_scope = try(local.m265["shared_scope"], null)
  start_date = try(local.m265["start_date"], null)
  dynamic "account" {
    for_each = try(local.m265["account"], null) == null ? [] : local.m265["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "alarm_rules" {
    for_each = try(local.m265["alarm_rules"], null) == null ? [] : local.m265["alarm_rules"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m265["ancestors"], null) == null ? [] : local.m265["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "classifications" {
    for_each = try(local.m265["classifications"], null) == null ? [] : local.m265["classifications"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_task" {
    for_each = try(local.m265["end_task"], null) == null ? [] : local.m265["end_task"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "entity" {
    for_each = try(local.m265["entity"], null) == null ? [] : local.m265["entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "filter_refs" {
    for_each = try(local.m265["filter_refs"], null) == null ? [] : local.m265["filter_refs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m265["organization"], null) == null ? [] : local.m265["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m265["parent"], null) == null ? [] : local.m265["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m265["permission_resources"], null) == null ? [] : local.m265["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "start_task" {
    for_each = try(local.m265["start_task"], null) == null ? [] : local.m265["start_task"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m265["tags"], null) == null ? [] : local.m265["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m265["version_context"], null) == null ? [] : local.m265["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
