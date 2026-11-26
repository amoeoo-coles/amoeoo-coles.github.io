# Sample data source intersight_kvm_policy_inventory — reads ../models/data_intersight_kvm_policy_inventory.yml
locals { m784 = yamldecode(file("${path.module}/../models/data_intersight_kvm_policy_inventory.yml"))["data_intersight_kvm_policy_inventory"] }

data "intersight_kvm_policy_inventory" "n784" {
  account_moid = try(local.m784["account_moid"], null)
  additional_properties = try(local.m784["additional_properties"], null)
  class_id = try(local.m784["class_id"], null)
  create_time = try(local.m784["create_time"], null)
  description = try(local.m784["description"], null)
  device_mo_id = try(local.m784["device_mo_id"], null)
  domain_group_moid = try(local.m784["domain_group_moid"], null)
  enable_local_server_video = try(local.m784["enable_local_server_video"], null)
  enable_video_encryption = try(local.m784["enable_video_encryption"], null)
  enabled = try(local.m784["enabled"], null)
  id = try(local.m784["id"], null)
  maximum_sessions = try(local.m784["maximum_sessions"], null)
  mod_time = try(local.m784["mod_time"], null)
  moid = try(local.m784["moid"], null)
  name = try(local.m784["name"], null)
  object_type = try(local.m784["object_type"], null)
  owners = try(local.m784["owners"], null)
  remote_port = try(local.m784["remote_port"], null)
  results = try(local.m784["results"], null)
  shared_scope = try(local.m784["shared_scope"], null)
  tunneled_kvm_enabled = try(local.m784["tunneled_kvm_enabled"], null)
  dynamic "ancestors" {
    for_each = try(local.m784["ancestors"], null) == null ? [] : local.m784["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m784["parent"], null) == null ? [] : local.m784["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m784["permission_resources"], null) == null ? [] : local.m784["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m784["tags"], null) == null ? [] : local.m784["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m784["target_mo"], null) == null ? [] : local.m784["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m784["version_context"], null) == null ? [] : local.m784["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
