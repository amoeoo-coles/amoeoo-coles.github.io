# Sample data source intersight_vnic_fc_qos_policy_inventory — reads ../models/data_intersight_vnic_fc_qos_policy_inventory.yml
locals { m1469 = yamldecode(file("${path.module}/../models/data_intersight_vnic_fc_qos_policy_inventory.yml"))["data_intersight_vnic_fc_qos_policy_inventory"] }

data "intersight_vnic_fc_qos_policy_inventory" "n1469" {
  account_moid = try(local.m1469["account_moid"], null)
  additional_properties = try(local.m1469["additional_properties"], null)
  burst = try(local.m1469["burst"], null)
  class_id = try(local.m1469["class_id"], null)
  cos = try(local.m1469["cos"], null)
  create_time = try(local.m1469["create_time"], null)
  description = try(local.m1469["description"], null)
  device_mo_id = try(local.m1469["device_mo_id"], null)
  domain_group_moid = try(local.m1469["domain_group_moid"], null)
  id = try(local.m1469["id"], null)
  max_data_field_size = try(local.m1469["max_data_field_size"], null)
  mod_time = try(local.m1469["mod_time"], null)
  moid = try(local.m1469["moid"], null)
  name = try(local.m1469["name"], null)
  object_type = try(local.m1469["object_type"], null)
  owners = try(local.m1469["owners"], null)
  priority = try(local.m1469["priority"], null)
  rate_limit = try(local.m1469["rate_limit"], null)
  results = try(local.m1469["results"], null)
  shared_scope = try(local.m1469["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1469["ancestors"], null) == null ? [] : local.m1469["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1469["parent"], null) == null ? [] : local.m1469["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1469["permission_resources"], null) == null ? [] : local.m1469["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1469["tags"], null) == null ? [] : local.m1469["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1469["target_mo"], null) == null ? [] : local.m1469["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1469["version_context"], null) == null ? [] : local.m1469["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
