# Sample data source intersight_sol_policy_inventory — reads ../models/data_intersight_sol_policy_inventory.yml
locals { m1211 = yamldecode(file("${path.module}/../models/data_intersight_sol_policy_inventory.yml"))["data_intersight_sol_policy_inventory"] }

data "intersight_sol_policy_inventory" "n1211" {
  account_moid = try(local.m1211["account_moid"], null)
  additional_properties = try(local.m1211["additional_properties"], null)
  baud_rate = try(local.m1211["baud_rate"], null)
  class_id = try(local.m1211["class_id"], null)
  com_port = try(local.m1211["com_port"], null)
  create_time = try(local.m1211["create_time"], null)
  description = try(local.m1211["description"], null)
  device_mo_id = try(local.m1211["device_mo_id"], null)
  domain_group_moid = try(local.m1211["domain_group_moid"], null)
  enabled = try(local.m1211["enabled"], null)
  id = try(local.m1211["id"], null)
  mod_time = try(local.m1211["mod_time"], null)
  moid = try(local.m1211["moid"], null)
  name = try(local.m1211["name"], null)
  object_type = try(local.m1211["object_type"], null)
  owners = try(local.m1211["owners"], null)
  results = try(local.m1211["results"], null)
  shared_scope = try(local.m1211["shared_scope"], null)
  ssh_port = try(local.m1211["ssh_port"], null)
  dynamic "ancestors" {
    for_each = try(local.m1211["ancestors"], null) == null ? [] : local.m1211["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1211["parent"], null) == null ? [] : local.m1211["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1211["permission_resources"], null) == null ? [] : local.m1211["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1211["tags"], null) == null ? [] : local.m1211["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1211["target_mo"], null) == null ? [] : local.m1211["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1211["version_context"], null) == null ? [] : local.m1211["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
