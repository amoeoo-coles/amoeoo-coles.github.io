# Sample data source intersight_fabric_switch_profile — reads ../models/data_intersight_fabric_switch_profile.yml
locals { m442 = yamldecode(file("${path.module}/../models/data_intersight_fabric_switch_profile.yml"))["data_intersight_fabric_switch_profile"] }

data "intersight_fabric_switch_profile" "n442" {
  account_moid = try(local.m442["account_moid"], null)
  action = try(local.m442["action"], null)
  additional_properties = try(local.m442["additional_properties"], null)
  class_id = try(local.m442["class_id"], null)
  create_time = try(local.m442["create_time"], null)
  deployed_policies = try(local.m442["deployed_policies"], null)
  description = try(local.m442["description"], null)
  domain_group_moid = try(local.m442["domain_group_moid"], null)
  fabric_pre_assign_by_serial = try(local.m442["fabric_pre_assign_by_serial"], null)
  id = try(local.m442["id"], null)
  mod_time = try(local.m442["mod_time"], null)
  moid = try(local.m442["moid"], null)
  name = try(local.m442["name"], null)
  object_type = try(local.m442["object_type"], null)
  overridden_list = try(local.m442["overridden_list"], null)
  owners = try(local.m442["owners"], null)
  removed_policies = try(local.m442["removed_policies"], null)
  results = try(local.m442["results"], null)
  shared_scope = try(local.m442["shared_scope"], null)
  switch_assignment_mode = try(local.m442["switch_assignment_mode"], null)
  switch_id = try(local.m442["switch_id"], null)
  target_platform = try(local.m442["target_platform"], null)
  template_sync_status = try(local.m442["template_sync_status"], null)
  type = try(local.m442["type"], null)
  dynamic "action_params" {
    for_each = try(local.m442["action_params"], null) == null ? [] : local.m442["action_params"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m442["ancestors"], null) == null ? [] : local.m442["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_switch" {
    for_each = try(local.m442["assigned_switch"], null) == null ? [] : local.m442["assigned_switch"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_switch" {
    for_each = try(local.m442["associated_switch"], null) == null ? [] : local.m442["associated_switch"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_change_context" {
    for_each = try(local.m442["config_change_context"], null) == null ? [] : local.m442["config_change_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_change_details" {
    for_each = try(local.m442["config_change_details"], null) == null ? [] : local.m442["config_change_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_changes" {
    for_each = try(local.m442["config_changes"], null) == null ? [] : local.m442["config_changes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_context" {
    for_each = try(local.m442["config_context"], null) == null ? [] : local.m442["config_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_result" {
    for_each = try(local.m442["config_result"], null) == null ? [] : local.m442["config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "incomplete_policies" {
    for_each = try(local.m442["incomplete_policies"], null) == null ? [] : local.m442["incomplete_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m442["parent"], null) == null ? [] : local.m442["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "partially_deployed_policies" {
    for_each = try(local.m442["partially_deployed_policies"], null) == null ? [] : local.m442["partially_deployed_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer_interface_compatibility_issues" {
    for_each = try(local.m442["peer_interface_compatibility_issues"], null) == null ? [] : local.m442["peer_interface_compatibility_issues"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m442["permission_resources"], null) == null ? [] : local.m442["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_bucket" {
    for_each = try(local.m442["policy_bucket"], null) == null ? [] : local.m442["policy_bucket"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_change_details" {
    for_each = try(local.m442["policy_change_details"], null) == null ? [] : local.m442["policy_change_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reported_policy_changes" {
    for_each = try(local.m442["reported_policy_changes"], null) == null ? [] : local.m442["reported_policy_changes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "running_workflows" {
    for_each = try(local.m442["running_workflows"], null) == null ? [] : local.m442["running_workflows"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scheduled_actions" {
    for_each = try(local.m442["scheduled_actions"], null) == null ? [] : local.m442["scheduled_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scheduled_switch_assignment" {
    for_each = try(local.m442["scheduled_switch_assignment"], null) == null ? [] : local.m442["scheduled_switch_assignment"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_template" {
    for_each = try(local.m442["src_template"], null) == null ? [] : local.m442["src_template"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "switch_cluster_profile" {
    for_each = try(local.m442["switch_cluster_profile"], null) == null ? [] : local.m442["switch_cluster_profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m442["tags"], null) == null ? [] : local.m442["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_actions" {
    for_each = try(local.m442["template_actions"], null) == null ? [] : local.m442["template_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_sync_errors" {
    for_each = try(local.m442["template_sync_errors"], null) == null ? [] : local.m442["template_sync_errors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m442["version_context"], null) == null ? [] : local.m442["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
