# Sample data source intersight_fabric_system_qos_policy — reads ../models/data_intersight_fabric_system_qos_policy.yml
locals { m444 = yamldecode(file("${path.module}/../models/data_intersight_fabric_system_qos_policy.yml"))["data_intersight_fabric_system_qos_policy"] }

data "intersight_fabric_system_qos_policy" "n444" {
  account_moid = try(local.m444["account_moid"], null)
  additional_properties = try(local.m444["additional_properties"], null)
  class_id = try(local.m444["class_id"], null)
  create_time = try(local.m444["create_time"], null)
  description = try(local.m444["description"], null)
  domain_group_moid = try(local.m444["domain_group_moid"], null)
  id = try(local.m444["id"], null)
  mod_time = try(local.m444["mod_time"], null)
  moid = try(local.m444["moid"], null)
  name = try(local.m444["name"], null)
  object_type = try(local.m444["object_type"], null)
  owners = try(local.m444["owners"], null)
  results = try(local.m444["results"], null)
  shared_scope = try(local.m444["shared_scope"], null)
  target_platform = try(local.m444["target_platform"], null)
  dynamic "ancestors" {
    for_each = try(local.m444["ancestors"], null) == null ? [] : local.m444["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "classes" {
    for_each = try(local.m444["classes"], null) == null ? [] : local.m444["classes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m444["organization"], null) == null ? [] : local.m444["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m444["parent"], null) == null ? [] : local.m444["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m444["permission_resources"], null) == null ? [] : local.m444["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pfc_watchdog" {
    for_each = try(local.m444["pfc_watchdog"], null) == null ? [] : local.m444["pfc_watchdog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m444["profiles"], null) == null ? [] : local.m444["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m444["tags"], null) == null ? [] : local.m444["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m444["version_context"], null) == null ? [] : local.m444["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
