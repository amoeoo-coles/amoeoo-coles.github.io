# Sample data source intersight_chassis_iom_profile — reads ../models/data_intersight_chassis_iom_profile.yml
locals { m219 = yamldecode(file("${path.module}/../models/data_intersight_chassis_iom_profile.yml"))["data_intersight_chassis_iom_profile"] }

data "intersight_chassis_iom_profile" "n219" {
  account_moid = try(local.m219["account_moid"], null)
  action = try(local.m219["action"], null)
  additional_properties = try(local.m219["additional_properties"], null)
  class_id = try(local.m219["class_id"], null)
  create_time = try(local.m219["create_time"], null)
  deployed_policies = try(local.m219["deployed_policies"], null)
  description = try(local.m219["description"], null)
  domain_group_moid = try(local.m219["domain_group_moid"], null)
  id = try(local.m219["id"], null)
  iom_entity = try(local.m219["iom_entity"], null)
  mod_time = try(local.m219["mod_time"], null)
  moid = try(local.m219["moid"], null)
  name = try(local.m219["name"], null)
  object_type = try(local.m219["object_type"], null)
  owners = try(local.m219["owners"], null)
  removed_policies = try(local.m219["removed_policies"], null)
  results = try(local.m219["results"], null)
  shared_scope = try(local.m219["shared_scope"], null)
  type = try(local.m219["type"], null)
  dynamic "action_params" {
    for_each = try(local.m219["action_params"], null) == null ? [] : local.m219["action_params"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m219["ancestors"], null) == null ? [] : local.m219["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_change_details" {
    for_each = try(local.m219["config_change_details"], null) == null ? [] : local.m219["config_change_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_changes" {
    for_each = try(local.m219["config_changes"], null) == null ? [] : local.m219["config_changes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_context" {
    for_each = try(local.m219["config_context"], null) == null ? [] : local.m219["config_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_result" {
    for_each = try(local.m219["config_result"], null) == null ? [] : local.m219["config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "incomplete_policies" {
    for_each = try(local.m219["incomplete_policies"], null) == null ? [] : local.m219["incomplete_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m219["organization"], null) == null ? [] : local.m219["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m219["parent"], null) == null ? [] : local.m219["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "partially_deployed_policies" {
    for_each = try(local.m219["partially_deployed_policies"], null) == null ? [] : local.m219["partially_deployed_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m219["permission_resources"], null) == null ? [] : local.m219["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_bucket" {
    for_each = try(local.m219["policy_bucket"], null) == null ? [] : local.m219["policy_bucket"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_change_details" {
    for_each = try(local.m219["policy_change_details"], null) == null ? [] : local.m219["policy_change_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m219["profile"], null) == null ? [] : local.m219["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reported_policy_changes" {
    for_each = try(local.m219["reported_policy_changes"], null) == null ? [] : local.m219["reported_policy_changes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scheduled_actions" {
    for_each = try(local.m219["scheduled_actions"], null) == null ? [] : local.m219["scheduled_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_template" {
    for_each = try(local.m219["src_template"], null) == null ? [] : local.m219["src_template"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m219["tags"], null) == null ? [] : local.m219["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m219["version_context"], null) == null ? [] : local.m219["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
