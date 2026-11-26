# Sample data source intersight_ssh_policy_inventory — reads ../models/data_intersight_ssh_policy_inventory.yml
locals { m1214 = yamldecode(file("${path.module}/../models/data_intersight_ssh_policy_inventory.yml"))["data_intersight_ssh_policy_inventory"] }

data "intersight_ssh_policy_inventory" "n1214" {
  account_moid = try(local.m1214["account_moid"], null)
  additional_properties = try(local.m1214["additional_properties"], null)
  class_id = try(local.m1214["class_id"], null)
  create_time = try(local.m1214["create_time"], null)
  description = try(local.m1214["description"], null)
  device_mo_id = try(local.m1214["device_mo_id"], null)
  domain_group_moid = try(local.m1214["domain_group_moid"], null)
  enabled = try(local.m1214["enabled"], null)
  id = try(local.m1214["id"], null)
  mod_time = try(local.m1214["mod_time"], null)
  moid = try(local.m1214["moid"], null)
  name = try(local.m1214["name"], null)
  object_type = try(local.m1214["object_type"], null)
  owners = try(local.m1214["owners"], null)
  port = try(local.m1214["port"], null)
  results = try(local.m1214["results"], null)
  shared_scope = try(local.m1214["shared_scope"], null)
  timeout = try(local.m1214["timeout"], null)
  dynamic "ancestors" {
    for_each = try(local.m1214["ancestors"], null) == null ? [] : local.m1214["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1214["parent"], null) == null ? [] : local.m1214["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1214["permission_resources"], null) == null ? [] : local.m1214["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1214["tags"], null) == null ? [] : local.m1214["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1214["target_mo"], null) == null ? [] : local.m1214["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1214["version_context"], null) == null ? [] : local.m1214["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
