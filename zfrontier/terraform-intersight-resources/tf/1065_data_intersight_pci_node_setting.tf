# Sample data source intersight_pci_node_setting — reads ../models/data_intersight_pci_node_setting.yml
locals { m1065 = yamldecode(file("${path.module}/../models/data_intersight_pci_node_setting.yml"))["data_intersight_pci_node_setting"] }

data "intersight_pci_node_setting" "n1065" {
  account_moid = try(local.m1065["account_moid"], null)
  additional_properties = try(local.m1065["additional_properties"], null)
  admin_action = try(local.m1065["admin_action"], null)
  admin_locator_led_state = try(local.m1065["admin_locator_led_state"], null)
  class_id = try(local.m1065["class_id"], null)
  config_state = try(local.m1065["config_state"], null)
  create_time = try(local.m1065["create_time"], null)
  device_mo_id = try(local.m1065["device_mo_id"], null)
  dn = try(local.m1065["dn"], null)
  domain_group_moid = try(local.m1065["domain_group_moid"], null)
  id = try(local.m1065["id"], null)
  mod_time = try(local.m1065["mod_time"], null)
  moid = try(local.m1065["moid"], null)
  name = try(local.m1065["name"], null)
  object_type = try(local.m1065["object_type"], null)
  owners = try(local.m1065["owners"], null)
  results = try(local.m1065["results"], null)
  rn = try(local.m1065["rn"], null)
  shared_scope = try(local.m1065["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1065["ancestors"], null) == null ? [] : local.m1065["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "locator_led" {
    for_each = try(local.m1065["locator_led"], null) == null ? [] : local.m1065["locator_led"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_op_status" {
    for_each = try(local.m1065["node_op_status"], null) == null ? [] : local.m1065["node_op_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1065["parent"], null) == null ? [] : local.m1065["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_node" {
    for_each = try(local.m1065["pci_node"], null) == null ? [] : local.m1065["pci_node"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1065["permission_resources"], null) == null ? [] : local.m1065["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1065["registered_device"], null) == null ? [] : local.m1065["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1065["tags"], null) == null ? [] : local.m1065["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1065["version_context"], null) == null ? [] : local.m1065["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
