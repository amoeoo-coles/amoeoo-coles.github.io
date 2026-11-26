# Sample data source intersight_hyperflex_cluster_network_policy — reads ../models/data_intersight_hyperflex_cluster_network_policy.yml
locals { m587 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_cluster_network_policy.yml"))["data_intersight_hyperflex_cluster_network_policy"] }

data "intersight_hyperflex_cluster_network_policy" "n587" {
  account_moid = try(local.m587["account_moid"], null)
  additional_properties = try(local.m587["additional_properties"], null)
  cimc_management_mode = try(local.m587["cimc_management_mode"], null)
  class_id = try(local.m587["class_id"], null)
  create_time = try(local.m587["create_time"], null)
  description = try(local.m587["description"], null)
  domain_group_moid = try(local.m587["domain_group_moid"], null)
  id = try(local.m587["id"], null)
  jumbo_frame = try(local.m587["jumbo_frame"], null)
  mod_time = try(local.m587["mod_time"], null)
  moid = try(local.m587["moid"], null)
  name = try(local.m587["name"], null)
  object_type = try(local.m587["object_type"], null)
  owners = try(local.m587["owners"], null)
  results = try(local.m587["results"], null)
  shared_scope = try(local.m587["shared_scope"], null)
  uplink_speed = try(local.m587["uplink_speed"], null)
  dynamic "ancestors" {
    for_each = try(local.m587["ancestors"], null) == null ? [] : local.m587["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profiles" {
    for_each = try(local.m587["cluster_profiles"], null) == null ? [] : local.m587["cluster_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "kvm_ip_range" {
    for_each = try(local.m587["kvm_ip_range"], null) == null ? [] : local.m587["kvm_ip_range"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mac_prefix_range" {
    for_each = try(local.m587["mac_prefix_range"], null) == null ? [] : local.m587["mac_prefix_range"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mgmt_vlan" {
    for_each = try(local.m587["mgmt_vlan"], null) == null ? [] : local.m587["mgmt_vlan"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m587["organization"], null) == null ? [] : local.m587["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m587["parent"], null) == null ? [] : local.m587["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m587["permission_resources"], null) == null ? [] : local.m587["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m587["tags"], null) == null ? [] : local.m587["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m587["version_context"], null) == null ? [] : local.m587["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vm_migration_vlan" {
    for_each = try(local.m587["vm_migration_vlan"], null) == null ? [] : local.m587["vm_migration_vlan"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vm_network_vlans" {
    for_each = try(local.m587["vm_network_vlans"], null) == null ? [] : local.m587["vm_network_vlans"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
