# Sample data source intersight_server_profile — reads ../models/data_intersight_server_profile.yml
locals { m1161 = yamldecode(file("${path.module}/../models/data_intersight_server_profile.yml"))["data_intersight_server_profile"] }

data "intersight_server_profile" "n1161" {
  account_moid = try(local.m1161["account_moid"], null)
  action = try(local.m1161["action"], null)
  additional_properties = try(local.m1161["additional_properties"], null)
  class_id = try(local.m1161["class_id"], null)
  create_time = try(local.m1161["create_time"], null)
  deploy_status = try(local.m1161["deploy_status"], null)
  deployed_policies = try(local.m1161["deployed_policies"], null)
  deployed_switches = try(local.m1161["deployed_switches"], null)
  description = try(local.m1161["description"], null)
  domain_group_moid = try(local.m1161["domain_group_moid"], null)
  id = try(local.m1161["id"], null)
  initial_auto_deploy_config_complete = try(local.m1161["initial_auto_deploy_config_complete"], null)
  initial_auto_deploy_mode = try(local.m1161["initial_auto_deploy_mode"], null)
  initial_auto_deploy_state = try(local.m1161["initial_auto_deploy_state"], null)
  is_pmc_deployed_secure_passphrase_set = try(var.secrets["data_intersight_server_profile.is_pmc_deployed_secure_passphrase_set"], local.m1161["is_pmc_deployed_secure_passphrase_set"])
  management_mode = try(local.m1161["management_mode"], null)
  mod_time = try(local.m1161["mod_time"], null)
  moid = try(local.m1161["moid"], null)
  name = try(local.m1161["name"], null)
  object_type = try(local.m1161["object_type"], null)
  overridden_list = try(local.m1161["overridden_list"], null)
  owners = try(local.m1161["owners"], null)
  pmc_deployed_secure_passphrase = try(var.secrets["data_intersight_server_profile.pmc_deployed_secure_passphrase"], local.m1161["pmc_deployed_secure_passphrase"])
  post_deploy_action = try(local.m1161["post_deploy_action"], null)
  removed_policies = try(local.m1161["removed_policies"], null)
  results = try(local.m1161["results"], null)
  server_assignment_mode = try(local.m1161["server_assignment_mode"], null)
  server_family = try(local.m1161["server_family"], null)
  server_pre_assign_by_serial = try(local.m1161["server_pre_assign_by_serial"], null)
  shared_scope = try(local.m1161["shared_scope"], null)
  static_uuid_address = try(local.m1161["static_uuid_address"], null)
  target_platform = try(local.m1161["target_platform"], null)
  template_sync_status = try(local.m1161["template_sync_status"], null)
  type = try(local.m1161["type"], null)
  undeploy_wf_tasks = try(local.m1161["undeploy_wf_tasks"], null)
  user_label = try(local.m1161["user_label"], null)
  uuid = try(local.m1161["uuid"], null)
  uuid_address_type = try(local.m1161["uuid_address_type"], null)
  dynamic "action_params" {
    for_each = try(local.m1161["action_params"], null) == null ? [] : local.m1161["action_params"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1161["ancestors"], null) == null ? [] : local.m1161["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_server" {
    for_each = try(local.m1161["assigned_server"], null) == null ? [] : local.m1161["assigned_server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_server" {
    for_each = try(local.m1161["associated_server"], null) == null ? [] : local.m1161["associated_server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_server_pool" {
    for_each = try(local.m1161["associated_server_pool"], null) == null ? [] : local.m1161["associated_server_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_change_context" {
    for_each = try(local.m1161["config_change_context"], null) == null ? [] : local.m1161["config_change_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_change_details" {
    for_each = try(local.m1161["config_change_details"], null) == null ? [] : local.m1161["config_change_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_changes" {
    for_each = try(local.m1161["config_changes"], null) == null ? [] : local.m1161["config_changes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_context" {
    for_each = try(local.m1161["config_context"], null) == null ? [] : local.m1161["config_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_result" {
    for_each = try(local.m1161["config_result"], null) == null ? [] : local.m1161["config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "incomplete_policies" {
    for_each = try(local.m1161["incomplete_policies"], null) == null ? [] : local.m1161["incomplete_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "internal_reservation_references" {
    for_each = try(local.m1161["internal_reservation_references"], null) == null ? [] : local.m1161["internal_reservation_references"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "leased_server" {
    for_each = try(local.m1161["leased_server"], null) == null ? [] : local.m1161["leased_server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "location_details" {
    for_each = try(local.m1161["location_details"], null) == null ? [] : local.m1161["location_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1161["organization"], null) == null ? [] : local.m1161["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1161["parent"], null) == null ? [] : local.m1161["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "partially_deployed_policies" {
    for_each = try(local.m1161["partially_deployed_policies"], null) == null ? [] : local.m1161["partially_deployed_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1161["permission_resources"], null) == null ? [] : local.m1161["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_bucket" {
    for_each = try(local.m1161["policy_bucket"], null) == null ? [] : local.m1161["policy_bucket"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_change_details" {
    for_each = try(local.m1161["policy_change_details"], null) == null ? [] : local.m1161["policy_change_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reported_policy_changes" {
    for_each = try(local.m1161["reported_policy_changes"], null) == null ? [] : local.m1161["reported_policy_changes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservation_references" {
    for_each = try(local.m1161["reservation_references"], null) == null ? [] : local.m1161["reservation_references"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_lease" {
    for_each = try(local.m1161["resource_lease"], null) == null ? [] : local.m1161["resource_lease"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "running_workflows" {
    for_each = try(local.m1161["running_workflows"], null) == null ? [] : local.m1161["running_workflows"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scheduled_actions" {
    for_each = try(local.m1161["scheduled_actions"], null) == null ? [] : local.m1161["scheduled_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scheduled_server_assignment" {
    for_each = try(local.m1161["scheduled_server_assignment"], null) == null ? [] : local.m1161["scheduled_server_assignment"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_pool" {
    for_each = try(local.m1161["server_pool"], null) == null ? [] : local.m1161["server_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_pre_assign_by_slot" {
    for_each = try(local.m1161["server_pre_assign_by_slot"], null) == null ? [] : local.m1161["server_pre_assign_by_slot"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_reservation" {
    for_each = try(local.m1161["server_reservation"], null) == null ? [] : local.m1161["server_reservation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_template" {
    for_each = try(local.m1161["src_template"], null) == null ? [] : local.m1161["src_template"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1161["tags"], null) == null ? [] : local.m1161["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_actions" {
    for_each = try(local.m1161["template_actions"], null) == null ? [] : local.m1161["template_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_sync_errors" {
    for_each = try(local.m1161["template_sync_errors"], null) == null ? [] : local.m1161["template_sync_errors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "uuid_lease" {
    for_each = try(local.m1161["uuid_lease"], null) == null ? [] : local.m1161["uuid_lease"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "uuid_pool" {
    for_each = try(local.m1161["uuid_pool"], null) == null ? [] : local.m1161["uuid_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1161["version_context"], null) == null ? [] : local.m1161["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
