# Sample data source intersight_vnic_fc_vhba_policy_inventory — reads ../models/data_intersight_vnic_fc_vhba_policy_inventory.yml
locals { m1471 = yamldecode(file("${path.module}/../models/data_intersight_vnic_fc_vhba_policy_inventory.yml"))["data_intersight_vnic_fc_vhba_policy_inventory"] }

data "intersight_vnic_fc_vhba_policy_inventory" "n1471" {
  account_moid = try(local.m1471["account_moid"], null)
  additional_properties = try(local.m1471["additional_properties"], null)
  class_id = try(local.m1471["class_id"], null)
  cos = try(local.m1471["cos"], null)
  create_time = try(local.m1471["create_time"], null)
  device_mo_id = try(local.m1471["device_mo_id"], null)
  domain_group_moid = try(local.m1471["domain_group_moid"], null)
  id = try(local.m1471["id"], null)
  max_data_field_size = try(local.m1471["max_data_field_size"], null)
  mod_time = try(local.m1471["mod_time"], null)
  moid = try(local.m1471["moid"], null)
  name = try(local.m1471["name"], null)
  object_type = try(local.m1471["object_type"], null)
  owners = try(local.m1471["owners"], null)
  priority = try(local.m1471["priority"], null)
  results = try(local.m1471["results"], null)
  shared_scope = try(local.m1471["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1471["ancestors"], null) == null ? [] : local.m1471["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1471["parent"], null) == null ? [] : local.m1471["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1471["permission_resources"], null) == null ? [] : local.m1471["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1471["tags"], null) == null ? [] : local.m1471["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1471["target_mo"], null) == null ? [] : local.m1471["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1471["version_context"], null) == null ? [] : local.m1471["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
