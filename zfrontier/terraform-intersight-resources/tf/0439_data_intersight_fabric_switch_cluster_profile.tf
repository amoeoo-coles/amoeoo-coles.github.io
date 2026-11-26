# Sample data source intersight_fabric_switch_cluster_profile — reads ../models/data_intersight_fabric_switch_cluster_profile.yml
locals { m439 = yamldecode(file("${path.module}/../models/data_intersight_fabric_switch_cluster_profile.yml"))["data_intersight_fabric_switch_cluster_profile"] }

data "intersight_fabric_switch_cluster_profile" "n439" {
  account_moid = try(local.m439["account_moid"], null)
  action = try(local.m439["action"], null)
  additional_properties = try(local.m439["additional_properties"], null)
  chassis_assignment_mode = try(local.m439["chassis_assignment_mode"], null)
  chassis_pre_assign_by_serial = try(local.m439["chassis_pre_assign_by_serial"], null)
  class_id = try(local.m439["class_id"], null)
  create_time = try(local.m439["create_time"], null)
  deploy_status = try(local.m439["deploy_status"], null)
  deployed_switches = try(local.m439["deployed_switches"], null)
  description = try(local.m439["description"], null)
  domain_group_moid = try(local.m439["domain_group_moid"], null)
  id = try(local.m439["id"], null)
  mod_time = try(local.m439["mod_time"], null)
  moid = try(local.m439["moid"], null)
  name = try(local.m439["name"], null)
  object_type = try(local.m439["object_type"], null)
  overridden_list = try(local.m439["overridden_list"], null)
  owners = try(local.m439["owners"], null)
  results = try(local.m439["results"], null)
  shared_scope = try(local.m439["shared_scope"], null)
  switch_profiles_count = try(local.m439["switch_profiles_count"], null)
  target_platform = try(local.m439["target_platform"], null)
  template_sync_status = try(local.m439["template_sync_status"], null)
  type = try(local.m439["type"], null)
  user_label = try(local.m439["user_label"], null)
  dynamic "ancestors" {
    for_each = try(local.m439["ancestors"], null) == null ? [] : local.m439["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_entity" {
    for_each = try(local.m439["assigned_entity"], null) == null ? [] : local.m439["assigned_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_assignments" {
    for_each = try(local.m439["cluster_assignments"], null) == null ? [] : local.m439["cluster_assignments"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_context" {
    for_each = try(local.m439["config_context"], null) == null ? [] : local.m439["config_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m439["organization"], null) == null ? [] : local.m439["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m439["parent"], null) == null ? [] : local.m439["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m439["permission_resources"], null) == null ? [] : local.m439["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scheduled_chassis_assignment" {
    for_each = try(local.m439["scheduled_chassis_assignment"], null) == null ? [] : local.m439["scheduled_chassis_assignment"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_template" {
    for_each = try(local.m439["src_template"], null) == null ? [] : local.m439["src_template"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "switch_profiles" {
    for_each = try(local.m439["switch_profiles"], null) == null ? [] : local.m439["switch_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m439["tags"], null) == null ? [] : local.m439["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_actions" {
    for_each = try(local.m439["template_actions"], null) == null ? [] : local.m439["template_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_sync_errors" {
    for_each = try(local.m439["template_sync_errors"], null) == null ? [] : local.m439["template_sync_errors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m439["version_context"], null) == null ? [] : local.m439["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
