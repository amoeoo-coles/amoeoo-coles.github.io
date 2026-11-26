# Sample data source intersight_fabric_switch_profile_template — reads ../models/data_intersight_fabric_switch_profile_template.yml
locals { m443 = yamldecode(file("${path.module}/../models/data_intersight_fabric_switch_profile_template.yml"))["data_intersight_fabric_switch_profile_template"] }

data "intersight_fabric_switch_profile_template" "n443" {
  account_moid = try(local.m443["account_moid"], null)
  action = try(local.m443["action"], null)
  additional_properties = try(local.m443["additional_properties"], null)
  class_id = try(local.m443["class_id"], null)
  create_time = try(local.m443["create_time"], null)
  deployed_policies = try(local.m443["deployed_policies"], null)
  description = try(local.m443["description"], null)
  domain_group_moid = try(local.m443["domain_group_moid"], null)
  enable_override = try(local.m443["enable_override"], null)
  id = try(local.m443["id"], null)
  mod_time = try(local.m443["mod_time"], null)
  moid = try(local.m443["moid"], null)
  name = try(local.m443["name"], null)
  object_type = try(local.m443["object_type"], null)
  owners = try(local.m443["owners"], null)
  removed_policies = try(local.m443["removed_policies"], null)
  results = try(local.m443["results"], null)
  shared_scope = try(local.m443["shared_scope"], null)
  switch_id = try(local.m443["switch_id"], null)
  target_platform = try(local.m443["target_platform"], null)
  type = try(local.m443["type"], null)
  update_status = try(local.m443["update_status"], null)
  usage_count = try(local.m443["usage_count"], null)
  dynamic "action_params" {
    for_each = try(local.m443["action_params"], null) == null ? [] : local.m443["action_params"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m443["ancestors"], null) == null ? [] : local.m443["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_context" {
    for_each = try(local.m443["config_context"], null) == null ? [] : local.m443["config_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_result" {
    for_each = try(local.m443["config_result"], null) == null ? [] : local.m443["config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "incomplete_policies" {
    for_each = try(local.m443["incomplete_policies"], null) == null ? [] : local.m443["incomplete_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m443["parent"], null) == null ? [] : local.m443["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "partially_deployed_policies" {
    for_each = try(local.m443["partially_deployed_policies"], null) == null ? [] : local.m443["partially_deployed_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m443["permission_resources"], null) == null ? [] : local.m443["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_bucket" {
    for_each = try(local.m443["policy_bucket"], null) == null ? [] : local.m443["policy_bucket"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_change_details" {
    for_each = try(local.m443["policy_change_details"], null) == null ? [] : local.m443["policy_change_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reported_policy_changes" {
    for_each = try(local.m443["reported_policy_changes"], null) == null ? [] : local.m443["reported_policy_changes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scheduled_actions" {
    for_each = try(local.m443["scheduled_actions"], null) == null ? [] : local.m443["scheduled_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_template" {
    for_each = try(local.m443["src_template"], null) == null ? [] : local.m443["src_template"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "switch_cluster_profile_template" {
    for_each = try(local.m443["switch_cluster_profile_template"], null) == null ? [] : local.m443["switch_cluster_profile_template"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m443["tags"], null) == null ? [] : local.m443["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_actions" {
    for_each = try(local.m443["template_actions"], null) == null ? [] : local.m443["template_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m443["version_context"], null) == null ? [] : local.m443["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
