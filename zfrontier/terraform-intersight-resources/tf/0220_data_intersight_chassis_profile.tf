# Sample data source intersight_chassis_profile — reads ../models/data_intersight_chassis_profile.yml
locals { m220 = yamldecode(file("${path.module}/../models/data_intersight_chassis_profile.yml"))["data_intersight_chassis_profile"] }

data "intersight_chassis_profile" "n220" {
  account_moid = try(local.m220["account_moid"], null)
  action = try(local.m220["action"], null)
  additional_properties = try(local.m220["additional_properties"], null)
  chassis_assignment_mode = try(local.m220["chassis_assignment_mode"], null)
  chassis_pre_assign_by_serial = try(local.m220["chassis_pre_assign_by_serial"], null)
  class_id = try(local.m220["class_id"], null)
  create_time = try(local.m220["create_time"], null)
  deployed_policies = try(local.m220["deployed_policies"], null)
  description = try(local.m220["description"], null)
  domain_group_moid = try(local.m220["domain_group_moid"], null)
  id = try(local.m220["id"], null)
  mod_time = try(local.m220["mod_time"], null)
  moid = try(local.m220["moid"], null)
  name = try(local.m220["name"], null)
  object_type = try(local.m220["object_type"], null)
  owners = try(local.m220["owners"], null)
  removed_policies = try(local.m220["removed_policies"], null)
  results = try(local.m220["results"], null)
  shared_scope = try(local.m220["shared_scope"], null)
  target_platform = try(local.m220["target_platform"], null)
  type = try(local.m220["type"], null)
  user_label = try(local.m220["user_label"], null)
  dynamic "action_params" {
    for_each = try(local.m220["action_params"], null) == null ? [] : local.m220["action_params"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m220["ancestors"], null) == null ? [] : local.m220["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_chassis" {
    for_each = try(local.m220["assigned_chassis"], null) == null ? [] : local.m220["assigned_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_chassis" {
    for_each = try(local.m220["associated_chassis"], null) == null ? [] : local.m220["associated_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "chassis_reservation" {
    for_each = try(local.m220["chassis_reservation"], null) == null ? [] : local.m220["chassis_reservation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_change_context" {
    for_each = try(local.m220["config_change_context"], null) == null ? [] : local.m220["config_change_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_change_details" {
    for_each = try(local.m220["config_change_details"], null) == null ? [] : local.m220["config_change_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_changes" {
    for_each = try(local.m220["config_changes"], null) == null ? [] : local.m220["config_changes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_context" {
    for_each = try(local.m220["config_context"], null) == null ? [] : local.m220["config_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_result" {
    for_each = try(local.m220["config_result"], null) == null ? [] : local.m220["config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "incomplete_policies" {
    for_each = try(local.m220["incomplete_policies"], null) == null ? [] : local.m220["incomplete_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iom_profiles" {
    for_each = try(local.m220["iom_profiles"], null) == null ? [] : local.m220["iom_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m220["organization"], null) == null ? [] : local.m220["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m220["parent"], null) == null ? [] : local.m220["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "partially_deployed_policies" {
    for_each = try(local.m220["partially_deployed_policies"], null) == null ? [] : local.m220["partially_deployed_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m220["permission_resources"], null) == null ? [] : local.m220["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_bucket" {
    for_each = try(local.m220["policy_bucket"], null) == null ? [] : local.m220["policy_bucket"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_change_details" {
    for_each = try(local.m220["policy_change_details"], null) == null ? [] : local.m220["policy_change_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reported_policy_changes" {
    for_each = try(local.m220["reported_policy_changes"], null) == null ? [] : local.m220["reported_policy_changes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservation_references" {
    for_each = try(local.m220["reservation_references"], null) == null ? [] : local.m220["reservation_references"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "running_workflows" {
    for_each = try(local.m220["running_workflows"], null) == null ? [] : local.m220["running_workflows"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scheduled_actions" {
    for_each = try(local.m220["scheduled_actions"], null) == null ? [] : local.m220["scheduled_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scheduled_chassis_assignment" {
    for_each = try(local.m220["scheduled_chassis_assignment"], null) == null ? [] : local.m220["scheduled_chassis_assignment"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_template" {
    for_each = try(local.m220["src_template"], null) == null ? [] : local.m220["src_template"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m220["tags"], null) == null ? [] : local.m220["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m220["version_context"], null) == null ? [] : local.m220["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
