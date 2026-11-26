# Sample data source intersight_hyperflex_health_check_schedule_policy — reads ../models/data_intersight_hyperflex_health_check_schedule_policy.yml
locals { m608 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_health_check_schedule_policy.yml"))["data_intersight_hyperflex_health_check_schedule_policy"] }

data "intersight_hyperflex_health_check_schedule_policy" "n608" {
  account_moid = try(local.m608["account_moid"], null)
  additional_properties = try(local.m608["additional_properties"], null)
  class_id = try(local.m608["class_id"], null)
  create_time = try(local.m608["create_time"], null)
  domain_group_moid = try(local.m608["domain_group_moid"], null)
  id = try(local.m608["id"], null)
  last_scheduled_on = try(local.m608["last_scheduled_on"], null)
  last_unscheduled_on = try(local.m608["last_unscheduled_on"], null)
  mod_time = try(local.m608["mod_time"], null)
  moid = try(local.m608["moid"], null)
  next_expected_execution = try(local.m608["next_expected_execution"], null)
  object_type = try(local.m608["object_type"], null)
  owners = try(local.m608["owners"], null)
  policy_enabled = try(local.m608["policy_enabled"], null)
  results = try(local.m608["results"], null)
  schedule_interval = try(local.m608["schedule_interval"], null)
  shared_scope = try(local.m608["shared_scope"], null)
  uuid = try(local.m608["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m608["ancestors"], null) == null ? [] : local.m608["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m608["parent"], null) == null ? [] : local.m608["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m608["permission_resources"], null) == null ? [] : local.m608["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m608["registered_device"], null) == null ? [] : local.m608["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m608["tags"], null) == null ? [] : local.m608["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m608["version_context"], null) == null ? [] : local.m608["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
