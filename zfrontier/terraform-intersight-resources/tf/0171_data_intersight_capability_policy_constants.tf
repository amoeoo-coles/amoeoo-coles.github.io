# Sample data source intersight_capability_policy_constants — reads ../models/data_intersight_capability_policy_constants.yml
locals { m171 = yamldecode(file("${path.module}/../models/data_intersight_capability_policy_constants.yml"))["data_intersight_capability_policy_constants"] }

data "intersight_capability_policy_constants" "n171" {
  account_moid = try(local.m171["account_moid"], null)
  additional_properties = try(local.m171["additional_properties"], null)
  boot_device_reserved_keywords = try(local.m171["boot_device_reserved_keywords"], null)
  class_id = try(local.m171["class_id"], null)
  create_time = try(local.m171["create_time"], null)
  domain_group_moid = try(local.m171["domain_group_moid"], null)
  id = try(local.m171["id"], null)
  mod_time = try(local.m171["mod_time"], null)
  moid = try(local.m171["moid"], null)
  name = try(local.m171["name"], null)
  object_type = try(local.m171["object_type"], null)
  owners = try(local.m171["owners"], null)
  results = try(local.m171["results"], null)
  shared_scope = try(local.m171["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m171["ancestors"], null) == null ? [] : local.m171["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m171["parent"], null) == null ? [] : local.m171["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m171["permission_resources"], null) == null ? [] : local.m171["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m171["tags"], null) == null ? [] : local.m171["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m171["version_context"], null) == null ? [] : local.m171["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
