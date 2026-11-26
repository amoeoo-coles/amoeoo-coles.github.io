# Sample data source intersight_appliance_upgrade_tracker — reads ../models/data_intersight_appliance_upgrade_tracker.yml
locals { m082 = yamldecode(file("${path.module}/../models/data_intersight_appliance_upgrade_tracker.yml"))["data_intersight_appliance_upgrade_tracker"] }

data "intersight_appliance_upgrade_tracker" "n082" {
  account_moid = try(local.m082["account_moid"], null)
  additional_properties = try(local.m082["additional_properties"], null)
  class_id = try(local.m082["class_id"], null)
  create_time = try(local.m082["create_time"], null)
  description = try(local.m082["description"], null)
  domain_group_moid = try(local.m082["domain_group_moid"], null)
  id = try(local.m082["id"], null)
  last_upgrade_failed = try(local.m082["last_upgrade_failed"], null)
  mod_time = try(local.m082["mod_time"], null)
  moid = try(local.m082["moid"], null)
  nr_version = try(local.m082["nr_version"], null)
  object_type = try(local.m082["object_type"], null)
  owners = try(local.m082["owners"], null)
  results = try(local.m082["results"], null)
  shared_scope = try(local.m082["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m082["account"], null) == null ? [] : local.m082["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m082["ancestors"], null) == null ? [] : local.m082["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m082["parent"], null) == null ? [] : local.m082["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m082["permission_resources"], null) == null ? [] : local.m082["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m082["tags"], null) == null ? [] : local.m082["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m082["version_context"], null) == null ? [] : local.m082["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
