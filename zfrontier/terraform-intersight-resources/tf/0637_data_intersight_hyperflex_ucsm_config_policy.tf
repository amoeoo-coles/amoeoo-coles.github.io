# Sample data source intersight_hyperflex_ucsm_config_policy — reads ../models/data_intersight_hyperflex_ucsm_config_policy.yml
locals { m637 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_ucsm_config_policy.yml"))["data_intersight_hyperflex_ucsm_config_policy"] }

data "intersight_hyperflex_ucsm_config_policy" "n637" {
  account_moid = try(local.m637["account_moid"], null)
  additional_properties = try(local.m637["additional_properties"], null)
  class_id = try(local.m637["class_id"], null)
  create_time = try(local.m637["create_time"], null)
  description = try(local.m637["description"], null)
  domain_group_moid = try(local.m637["domain_group_moid"], null)
  id = try(local.m637["id"], null)
  mod_time = try(local.m637["mod_time"], null)
  moid = try(local.m637["moid"], null)
  name = try(local.m637["name"], null)
  object_type = try(local.m637["object_type"], null)
  owners = try(local.m637["owners"], null)
  results = try(local.m637["results"], null)
  server_firmware_version = try(local.m637["server_firmware_version"], null)
  shared_scope = try(local.m637["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m637["ancestors"], null) == null ? [] : local.m637["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profiles" {
    for_each = try(local.m637["cluster_profiles"], null) == null ? [] : local.m637["cluster_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "kvm_ip_range" {
    for_each = try(local.m637["kvm_ip_range"], null) == null ? [] : local.m637["kvm_ip_range"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mac_prefix_range" {
    for_each = try(local.m637["mac_prefix_range"], null) == null ? [] : local.m637["mac_prefix_range"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m637["organization"], null) == null ? [] : local.m637["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m637["parent"], null) == null ? [] : local.m637["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m637["permission_resources"], null) == null ? [] : local.m637["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m637["tags"], null) == null ? [] : local.m637["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m637["version_context"], null) == null ? [] : local.m637["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
