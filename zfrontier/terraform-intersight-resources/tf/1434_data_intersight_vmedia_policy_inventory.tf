# Sample data source intersight_vmedia_policy_inventory — reads ../models/data_intersight_vmedia_policy_inventory.yml
locals { m1434 = yamldecode(file("${path.module}/../models/data_intersight_vmedia_policy_inventory.yml"))["data_intersight_vmedia_policy_inventory"] }

data "intersight_vmedia_policy_inventory" "n1434" {
  account_moid = try(local.m1434["account_moid"], null)
  additional_properties = try(local.m1434["additional_properties"], null)
  class_id = try(local.m1434["class_id"], null)
  create_time = try(local.m1434["create_time"], null)
  description = try(local.m1434["description"], null)
  device_mo_id = try(local.m1434["device_mo_id"], null)
  domain_group_moid = try(local.m1434["domain_group_moid"], null)
  enabled = try(local.m1434["enabled"], null)
  encryption = try(local.m1434["encryption"], null)
  id = try(local.m1434["id"], null)
  low_power_usb = try(local.m1434["low_power_usb"], null)
  mod_time = try(local.m1434["mod_time"], null)
  moid = try(local.m1434["moid"], null)
  name = try(local.m1434["name"], null)
  object_type = try(local.m1434["object_type"], null)
  owners = try(local.m1434["owners"], null)
  results = try(local.m1434["results"], null)
  shared_scope = try(local.m1434["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1434["ancestors"], null) == null ? [] : local.m1434["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mappings" {
    for_each = try(local.m1434["mappings"], null) == null ? [] : local.m1434["mappings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1434["parent"], null) == null ? [] : local.m1434["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1434["permission_resources"], null) == null ? [] : local.m1434["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1434["tags"], null) == null ? [] : local.m1434["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1434["target_mo"], null) == null ? [] : local.m1434["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1434["version_context"], null) == null ? [] : local.m1434["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
