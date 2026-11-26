# Sample data source intersight_syslog_policy_inventory — reads ../models/data_intersight_syslog_policy_inventory.yml
locals { m1357 = yamldecode(file("${path.module}/../models/data_intersight_syslog_policy_inventory.yml"))["data_intersight_syslog_policy_inventory"] }

data "intersight_syslog_policy_inventory" "n1357" {
  account_moid = try(local.m1357["account_moid"], null)
  additional_properties = try(local.m1357["additional_properties"], null)
  class_id = try(local.m1357["class_id"], null)
  create_time = try(local.m1357["create_time"], null)
  description = try(local.m1357["description"], null)
  device_mo_id = try(local.m1357["device_mo_id"], null)
  domain_group_moid = try(local.m1357["domain_group_moid"], null)
  id = try(local.m1357["id"], null)
  mod_time = try(local.m1357["mod_time"], null)
  moid = try(local.m1357["moid"], null)
  name = try(local.m1357["name"], null)
  object_type = try(local.m1357["object_type"], null)
  owners = try(local.m1357["owners"], null)
  results = try(local.m1357["results"], null)
  shared_scope = try(local.m1357["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1357["ancestors"], null) == null ? [] : local.m1357["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "local_clients" {
    for_each = try(local.m1357["local_clients"], null) == null ? [] : local.m1357["local_clients"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1357["parent"], null) == null ? [] : local.m1357["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1357["permission_resources"], null) == null ? [] : local.m1357["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "remote_clients" {
    for_each = try(local.m1357["remote_clients"], null) == null ? [] : local.m1357["remote_clients"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1357["tags"], null) == null ? [] : local.m1357["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1357["target_mo"], null) == null ? [] : local.m1357["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1357["version_context"], null) == null ? [] : local.m1357["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
