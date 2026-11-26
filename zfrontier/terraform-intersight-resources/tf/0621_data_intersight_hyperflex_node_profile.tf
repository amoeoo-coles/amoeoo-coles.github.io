# Sample data source intersight_hyperflex_node_profile — reads ../models/data_intersight_hyperflex_node_profile.yml
locals { m621 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_node_profile.yml"))["data_intersight_hyperflex_node_profile"] }

data "intersight_hyperflex_node_profile" "n621" {
  account_moid = try(local.m621["account_moid"], null)
  action = try(local.m621["action"], null)
  additional_properties = try(local.m621["additional_properties"], null)
  class_id = try(local.m621["class_id"], null)
  create_time = try(local.m621["create_time"], null)
  deployed_policies = try(local.m621["deployed_policies"], null)
  description = try(local.m621["description"], null)
  domain_group_moid = try(local.m621["domain_group_moid"], null)
  hxdp_data_ip = try(local.m621["hxdp_data_ip"], null)
  hxdp_mgmt_ip = try(local.m621["hxdp_mgmt_ip"], null)
  hxdp_storage_client_ip = try(local.m621["hxdp_storage_client_ip"], null)
  hypervisor_control_ip = try(local.m621["hypervisor_control_ip"], null)
  hypervisor_data_ip = try(local.m621["hypervisor_data_ip"], null)
  hypervisor_mgmt_ip = try(local.m621["hypervisor_mgmt_ip"], null)
  id = try(local.m621["id"], null)
  mod_time = try(local.m621["mod_time"], null)
  moid = try(local.m621["moid"], null)
  name = try(local.m621["name"], null)
  node_role = try(local.m621["node_role"], null)
  object_type = try(local.m621["object_type"], null)
  owners = try(local.m621["owners"], null)
  removed_policies = try(local.m621["removed_policies"], null)
  results = try(local.m621["results"], null)
  shared_scope = try(local.m621["shared_scope"], null)
  type = try(local.m621["type"], null)
  dynamic "action_params" {
    for_each = try(local.m621["action_params"], null) == null ? [] : local.m621["action_params"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m621["ancestors"], null) == null ? [] : local.m621["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_server" {
    for_each = try(local.m621["assigned_server"], null) == null ? [] : local.m621["assigned_server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profile" {
    for_each = try(local.m621["cluster_profile"], null) == null ? [] : local.m621["cluster_profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_context" {
    for_each = try(local.m621["config_context"], null) == null ? [] : local.m621["config_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "incomplete_policies" {
    for_each = try(local.m621["incomplete_policies"], null) == null ? [] : local.m621["incomplete_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node" {
    for_each = try(local.m621["node"], null) == null ? [] : local.m621["node"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m621["parent"], null) == null ? [] : local.m621["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "partially_deployed_policies" {
    for_each = try(local.m621["partially_deployed_policies"], null) == null ? [] : local.m621["partially_deployed_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m621["permission_resources"], null) == null ? [] : local.m621["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_bucket" {
    for_each = try(local.m621["policy_bucket"], null) == null ? [] : local.m621["policy_bucket"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_change_details" {
    for_each = try(local.m621["policy_change_details"], null) == null ? [] : local.m621["policy_change_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reported_policy_changes" {
    for_each = try(local.m621["reported_policy_changes"], null) == null ? [] : local.m621["reported_policy_changes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scheduled_actions" {
    for_each = try(local.m621["scheduled_actions"], null) == null ? [] : local.m621["scheduled_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_template" {
    for_each = try(local.m621["src_template"], null) == null ? [] : local.m621["src_template"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m621["tags"], null) == null ? [] : local.m621["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m621["version_context"], null) == null ? [] : local.m621["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
