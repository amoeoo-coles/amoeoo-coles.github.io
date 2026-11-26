# Sample data source intersight_chassis_profile_template — reads ../models/data_intersight_chassis_profile_template.yml
locals { m221 = yamldecode(file("${path.module}/../models/data_intersight_chassis_profile_template.yml"))["data_intersight_chassis_profile_template"] }

data "intersight_chassis_profile_template" "n221" {
  account_moid = try(local.m221["account_moid"], null)
  action = try(local.m221["action"], null)
  additional_properties = try(local.m221["additional_properties"], null)
  class_id = try(local.m221["class_id"], null)
  create_time = try(local.m221["create_time"], null)
  deployed_policies = try(local.m221["deployed_policies"], null)
  description = try(local.m221["description"], null)
  domain_group_moid = try(local.m221["domain_group_moid"], null)
  id = try(local.m221["id"], null)
  mod_time = try(local.m221["mod_time"], null)
  moid = try(local.m221["moid"], null)
  name = try(local.m221["name"], null)
  object_type = try(local.m221["object_type"], null)
  owners = try(local.m221["owners"], null)
  removed_policies = try(local.m221["removed_policies"], null)
  results = try(local.m221["results"], null)
  shared_scope = try(local.m221["shared_scope"], null)
  target_platform = try(local.m221["target_platform"], null)
  type = try(local.m221["type"], null)
  usage = try(local.m221["usage"], null)
  dynamic "action_params" {
    for_each = try(local.m221["action_params"], null) == null ? [] : local.m221["action_params"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m221["ancestors"], null) == null ? [] : local.m221["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_context" {
    for_each = try(local.m221["config_context"], null) == null ? [] : local.m221["config_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_result" {
    for_each = try(local.m221["config_result"], null) == null ? [] : local.m221["config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "incomplete_policies" {
    for_each = try(local.m221["incomplete_policies"], null) == null ? [] : local.m221["incomplete_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iom_profiles" {
    for_each = try(local.m221["iom_profiles"], null) == null ? [] : local.m221["iom_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m221["organization"], null) == null ? [] : local.m221["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m221["parent"], null) == null ? [] : local.m221["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "partially_deployed_policies" {
    for_each = try(local.m221["partially_deployed_policies"], null) == null ? [] : local.m221["partially_deployed_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m221["permission_resources"], null) == null ? [] : local.m221["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_bucket" {
    for_each = try(local.m221["policy_bucket"], null) == null ? [] : local.m221["policy_bucket"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_change_details" {
    for_each = try(local.m221["policy_change_details"], null) == null ? [] : local.m221["policy_change_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reported_policy_changes" {
    for_each = try(local.m221["reported_policy_changes"], null) == null ? [] : local.m221["reported_policy_changes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scheduled_actions" {
    for_each = try(local.m221["scheduled_actions"], null) == null ? [] : local.m221["scheduled_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_template" {
    for_each = try(local.m221["src_template"], null) == null ? [] : local.m221["src_template"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m221["tags"], null) == null ? [] : local.m221["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m221["version_context"], null) == null ? [] : local.m221["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
