# Sample data source intersight_vnic_fc_network_policy_inventory — reads ../models/data_intersight_vnic_fc_network_policy_inventory.yml
locals { m1467 = yamldecode(file("${path.module}/../models/data_intersight_vnic_fc_network_policy_inventory.yml"))["data_intersight_vnic_fc_network_policy_inventory"] }

data "intersight_vnic_fc_network_policy_inventory" "n1467" {
  account_moid = try(local.m1467["account_moid"], null)
  additional_properties = try(local.m1467["additional_properties"], null)
  class_id = try(local.m1467["class_id"], null)
  create_time = try(local.m1467["create_time"], null)
  description = try(local.m1467["description"], null)
  device_mo_id = try(local.m1467["device_mo_id"], null)
  domain_group_moid = try(local.m1467["domain_group_moid"], null)
  id = try(local.m1467["id"], null)
  mod_time = try(local.m1467["mod_time"], null)
  moid = try(local.m1467["moid"], null)
  name = try(local.m1467["name"], null)
  object_type = try(local.m1467["object_type"], null)
  owners = try(local.m1467["owners"], null)
  results = try(local.m1467["results"], null)
  shared_scope = try(local.m1467["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1467["ancestors"], null) == null ? [] : local.m1467["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1467["parent"], null) == null ? [] : local.m1467["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1467["permission_resources"], null) == null ? [] : local.m1467["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1467["tags"], null) == null ? [] : local.m1467["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1467["target_mo"], null) == null ? [] : local.m1467["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1467["version_context"], null) == null ? [] : local.m1467["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vsan_settings" {
    for_each = try(local.m1467["vsan_settings"], null) == null ? [] : local.m1467["vsan_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
