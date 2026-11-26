# Sample data source intersight_onprem_upgrade — reads ../models/data_intersight_onprem_upgrade.yml
locals { m1016 = yamldecode(file("${path.module}/../models/data_intersight_onprem_upgrade.yml"))["data_intersight_onprem_upgrade"] }

data "intersight_onprem_upgrade" "n1016" {
  account_moid = try(local.m1016["account_moid"], null)
  active = try(local.m1016["active"], null)
  additional_properties = try(local.m1016["additional_properties"], null)
  all_nodes_pingable = try(local.m1016["all_nodes_pingable"], null)
  class_id = try(local.m1016["class_id"], null)
  create_time = try(local.m1016["create_time"], null)
  description = try(local.m1016["description"], null)
  domain_group_moid = try(local.m1016["domain_group_moid"], null)
  end_time = try(local.m1016["end_time"], null)
  error_code = try(local.m1016["error_code"], null)
  fingerprint = try(local.m1016["fingerprint"], null)
  id = try(local.m1016["id"], null)
  is_patch = try(local.m1016["is_patch"], null)
  is_rolling_back = try(local.m1016["is_rolling_back"], null)
  is_user_triggered = try(local.m1016["is_user_triggered"], null)
  mod_time = try(local.m1016["mod_time"], null)
  moid = try(local.m1016["moid"], null)
  name = try(local.m1016["name"], null)
  nr_version = try(local.m1016["nr_version"], null)
  object_type = try(local.m1016["object_type"], null)
  owners = try(local.m1016["owners"], null)
  progress = try(local.m1016["progress"], null)
  results = try(local.m1016["results"], null)
  rollback_needed = try(local.m1016["rollback_needed"], null)
  rollback_status = try(local.m1016["rollback_status"], null)
  scheduled_time = try(local.m1016["scheduled_time"], null)
  shared_scope = try(local.m1016["shared_scope"], null)
  start_time = try(local.m1016["start_time"], null)
  status = try(local.m1016["status"], null)
  upgrade_grace_period = try(local.m1016["upgrade_grace_period"], null)
  upgrade_impact_duration = try(local.m1016["upgrade_impact_duration"], null)
  upgrade_impact_enum = try(local.m1016["upgrade_impact_enum"], null)
  dynamic "ancestors" {
    for_each = try(local.m1016["ancestors"], null) == null ? [] : local.m1016["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "completed_phases" {
    for_each = try(local.m1016["completed_phases"], null) == null ? [] : local.m1016["completed_phases"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "current_phase" {
    for_each = try(local.m1016["current_phase"], null) == null ? [] : local.m1016["current_phase"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1016["parent"], null) == null ? [] : local.m1016["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1016["permission_resources"], null) == null ? [] : local.m1016["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1016["tags"], null) == null ? [] : local.m1016["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1016["version_context"], null) == null ? [] : local.m1016["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
