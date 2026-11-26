# Sample data source intersight_cond_alarm_rule — reads ../models/data_intersight_cond_alarm_rule.yml
locals { m264 = yamldecode(file("${path.module}/../models/data_intersight_cond_alarm_rule.yml"))["data_intersight_cond_alarm_rule"] }

data "intersight_cond_alarm_rule" "n264" {
  account_moid = try(local.m264["account_moid"], null)
  additional_properties = try(local.m264["additional_properties"], null)
  class_id = try(local.m264["class_id"], null)
  create_time = try(local.m264["create_time"], null)
  description = try(local.m264["description"], null)
  domain_group_moid = try(local.m264["domain_group_moid"], null)
  id = try(local.m264["id"], null)
  mod_time = try(local.m264["mod_time"], null)
  moid = try(local.m264["moid"], null)
  name = try(local.m264["name"], null)
  object_type = try(local.m264["object_type"], null)
  owners = try(local.m264["owners"], null)
  results = try(local.m264["results"], null)
  shared_scope = try(local.m264["shared_scope"], null)
  state = try(local.m264["state"], null)
  system_disabled_time = try(local.m264["system_disabled_time"], null)
  dynamic "account" {
    for_each = try(local.m264["account"], null) == null ? [] : local.m264["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m264["ancestors"], null) == null ? [] : local.m264["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "devices" {
    for_each = try(local.m264["devices"], null) == null ? [] : local.m264["devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m264["parent"], null) == null ? [] : local.m264["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m264["permission_resources"], null) == null ? [] : local.m264["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m264["tags"], null) == null ? [] : local.m264["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "threshold_definition_states" {
    for_each = try(local.m264["threshold_definition_states"], null) == null ? [] : local.m264["threshold_definition_states"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "threshold_definitions" {
    for_each = try(local.m264["threshold_definitions"], null) == null ? [] : local.m264["threshold_definitions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m264["version_context"], null) == null ? [] : local.m264["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
