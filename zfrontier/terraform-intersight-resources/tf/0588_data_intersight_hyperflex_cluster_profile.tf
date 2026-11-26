# Sample data source intersight_hyperflex_cluster_profile — reads ../models/data_intersight_hyperflex_cluster_profile.yml
locals { m588 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_cluster_profile.yml"))["data_intersight_hyperflex_cluster_profile"] }

data "intersight_hyperflex_cluster_profile" "n588" {
  account_moid = try(local.m588["account_moid"], null)
  action = try(local.m588["action"], null)
  additional_properties = try(local.m588["additional_properties"], null)
  class_id = try(local.m588["class_id"], null)
  create_time = try(local.m588["create_time"], null)
  data_ip_address = try(local.m588["data_ip_address"], null)
  deployed_policies = try(local.m588["deployed_policies"], null)
  description = try(local.m588["description"], null)
  domain_group_moid = try(local.m588["domain_group_moid"], null)
  host_name_prefix = try(local.m588["host_name_prefix"], null)
  hypervisor_control_ip_address = try(local.m588["hypervisor_control_ip_address"], null)
  hypervisor_type = try(local.m588["hypervisor_type"], null)
  id = try(local.m588["id"], null)
  is_nic_based = try(local.m588["is_nic_based"], null)
  mac_address_prefix = try(local.m588["mac_address_prefix"], null)
  mgmt_ip_address = try(local.m588["mgmt_ip_address"], null)
  mgmt_platform = try(local.m588["mgmt_platform"], null)
  mod_time = try(local.m588["mod_time"], null)
  moid = try(local.m588["moid"], null)
  name = try(local.m588["name"], null)
  object_type = try(local.m588["object_type"], null)
  owners = try(local.m588["owners"], null)
  removed_policies = try(local.m588["removed_policies"], null)
  replication = try(local.m588["replication"], null)
  results = try(local.m588["results"], null)
  shared_scope = try(local.m588["shared_scope"], null)
  storage_client_ip_address = try(local.m588["storage_client_ip_address"], null)
  storage_client_netmask = try(local.m588["storage_client_netmask"], null)
  storage_cluster_auxiliary_ip = try(local.m588["storage_cluster_auxiliary_ip"], null)
  storage_type = try(local.m588["storage_type"], null)
  type = try(local.m588["type"], null)
  wwxn_prefix = try(local.m588["wwxn_prefix"], null)
  dynamic "action_params" {
    for_each = try(local.m588["action_params"], null) == null ? [] : local.m588["action_params"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m588["ancestors"], null) == null ? [] : local.m588["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_cluster" {
    for_each = try(local.m588["associated_cluster"], null) == null ? [] : local.m588["associated_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "auto_support" {
    for_each = try(local.m588["auto_support"], null) == null ? [] : local.m588["auto_support"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_internal_subnet" {
    for_each = try(local.m588["cluster_internal_subnet"], null) == null ? [] : local.m588["cluster_internal_subnet"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_network" {
    for_each = try(local.m588["cluster_network"], null) == null ? [] : local.m588["cluster_network"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_storage" {
    for_each = try(local.m588["cluster_storage"], null) == null ? [] : local.m588["cluster_storage"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_context" {
    for_each = try(local.m588["config_context"], null) == null ? [] : local.m588["config_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_result" {
    for_each = try(local.m588["config_result"], null) == null ? [] : local.m588["config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ext_fc_storage" {
    for_each = try(local.m588["ext_fc_storage"], null) == null ? [] : local.m588["ext_fc_storage"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ext_iscsi_storage" {
    for_each = try(local.m588["ext_iscsi_storage"], null) == null ? [] : local.m588["ext_iscsi_storage"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "httpproxypolicy" {
    for_each = try(local.m588["httpproxypolicy"], null) == null ? [] : local.m588["httpproxypolicy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "incomplete_policies" {
    for_each = try(local.m588["incomplete_policies"], null) == null ? [] : local.m588["incomplete_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "local_credential" {
    for_each = try(local.m588["local_credential"], null) == null ? [] : local.m588["local_credential"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_config" {
    for_each = try(local.m588["node_config"], null) == null ? [] : local.m588["node_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_profile_config" {
    for_each = try(local.m588["node_profile_config"], null) == null ? [] : local.m588["node_profile_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m588["organization"], null) == null ? [] : local.m588["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m588["parent"], null) == null ? [] : local.m588["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "partially_deployed_policies" {
    for_each = try(local.m588["partially_deployed_policies"], null) == null ? [] : local.m588["partially_deployed_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m588["permission_resources"], null) == null ? [] : local.m588["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_bucket" {
    for_each = try(local.m588["policy_bucket"], null) == null ? [] : local.m588["policy_bucket"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy_change_details" {
    for_each = try(local.m588["policy_change_details"], null) == null ? [] : local.m588["policy_change_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "proxy_setting" {
    for_each = try(local.m588["proxy_setting"], null) == null ? [] : local.m588["proxy_setting"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reported_policy_changes" {
    for_each = try(local.m588["reported_policy_changes"], null) == null ? [] : local.m588["reported_policy_changes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "running_workflows" {
    for_each = try(local.m588["running_workflows"], null) == null ? [] : local.m588["running_workflows"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scheduled_actions" {
    for_each = try(local.m588["scheduled_actions"], null) == null ? [] : local.m588["scheduled_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "software_version" {
    for_each = try(local.m588["software_version"], null) == null ? [] : local.m588["software_version"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_template" {
    for_each = try(local.m588["src_template"], null) == null ? [] : local.m588["src_template"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_client_vlan" {
    for_each = try(local.m588["storage_client_vlan"], null) == null ? [] : local.m588["storage_client_vlan"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_data_vlan" {
    for_each = try(local.m588["storage_data_vlan"], null) == null ? [] : local.m588["storage_data_vlan"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sys_config" {
    for_each = try(local.m588["sys_config"], null) == null ? [] : local.m588["sys_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m588["tags"], null) == null ? [] : local.m588["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ucsm_config" {
    for_each = try(local.m588["ucsm_config"], null) == null ? [] : local.m588["ucsm_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vcenter_config" {
    for_each = try(local.m588["vcenter_config"], null) == null ? [] : local.m588["vcenter_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m588["version_context"], null) == null ? [] : local.m588["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
