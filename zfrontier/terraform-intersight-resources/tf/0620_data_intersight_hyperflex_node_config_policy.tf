# Sample data source intersight_hyperflex_node_config_policy — reads ../models/data_intersight_hyperflex_node_config_policy.yml
locals { m620 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_node_config_policy.yml"))["data_intersight_hyperflex_node_config_policy"] }

data "intersight_hyperflex_node_config_policy" "n620" {
  account_moid = try(local.m620["account_moid"], null)
  additional_properties = try(local.m620["additional_properties"], null)
  class_id = try(local.m620["class_id"], null)
  create_time = try(local.m620["create_time"], null)
  description = try(local.m620["description"], null)
  domain_group_moid = try(local.m620["domain_group_moid"], null)
  id = try(local.m620["id"], null)
  mod_time = try(local.m620["mod_time"], null)
  moid = try(local.m620["moid"], null)
  name = try(local.m620["name"], null)
  node_name_prefix = try(local.m620["node_name_prefix"], null)
  object_type = try(local.m620["object_type"], null)
  owners = try(local.m620["owners"], null)
  results = try(local.m620["results"], null)
  shared_scope = try(local.m620["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m620["ancestors"], null) == null ? [] : local.m620["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profiles" {
    for_each = try(local.m620["cluster_profiles"], null) == null ? [] : local.m620["cluster_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "data_ip_range" {
    for_each = try(local.m620["data_ip_range"], null) == null ? [] : local.m620["data_ip_range"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hxdp_ip_range" {
    for_each = try(local.m620["hxdp_ip_range"], null) == null ? [] : local.m620["hxdp_ip_range"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hypervisor_control_ip_range" {
    for_each = try(local.m620["hypervisor_control_ip_range"], null) == null ? [] : local.m620["hypervisor_control_ip_range"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mgmt_ip_range" {
    for_each = try(local.m620["mgmt_ip_range"], null) == null ? [] : local.m620["mgmt_ip_range"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m620["organization"], null) == null ? [] : local.m620["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m620["parent"], null) == null ? [] : local.m620["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m620["permission_resources"], null) == null ? [] : local.m620["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m620["tags"], null) == null ? [] : local.m620["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m620["version_context"], null) == null ? [] : local.m620["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
