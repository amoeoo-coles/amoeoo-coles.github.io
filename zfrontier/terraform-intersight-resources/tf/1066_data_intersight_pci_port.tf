# Sample data source intersight_pci_port — reads ../models/data_intersight_pci_port.yml
locals { m1066 = yamldecode(file("${path.module}/../models/data_intersight_pci_port.yml"))["data_intersight_pci_port"] }

data "intersight_pci_port" "n1066" {
  account_moid = try(local.m1066["account_moid"], null)
  additional_properties = try(local.m1066["additional_properties"], null)
  class_id = try(local.m1066["class_id"], null)
  create_time = try(local.m1066["create_time"], null)
  device_mo_id = try(local.m1066["device_mo_id"], null)
  dn = try(local.m1066["dn"], null)
  domain_group_moid = try(local.m1066["domain_group_moid"], null)
  id = try(local.m1066["id"], null)
  mod_time = try(local.m1066["mod_time"], null)
  moid = try(local.m1066["moid"], null)
  name = try(local.m1066["name"], null)
  object_type = try(local.m1066["object_type"], null)
  oper_reason = try(local.m1066["oper_reason"], null)
  oper_state = try(local.m1066["oper_state"], null)
  owners = try(local.m1066["owners"], null)
  port_id = try(local.m1066["port_id"], null)
  results = try(local.m1066["results"], null)
  rn = try(local.m1066["rn"], null)
  role = try(local.m1066["role"], null)
  shared_scope = try(local.m1066["shared_scope"], null)
  width = try(local.m1066["width"], null)
  dynamic "ancestors" {
    for_each = try(local.m1066["ancestors"], null) == null ? [] : local.m1066["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1066["inventory_device_info"], null) == null ? [] : local.m1066["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1066["parent"], null) == null ? [] : local.m1066["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_endpoint" {
    for_each = try(local.m1066["pci_endpoint"], null) == null ? [] : local.m1066["pci_endpoint"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_switch" {
    for_each = try(local.m1066["pci_switch"], null) == null ? [] : local.m1066["pci_switch"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1066["permission_resources"], null) == null ? [] : local.m1066["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1066["registered_device"], null) == null ? [] : local.m1066["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1066["tags"], null) == null ? [] : local.m1066["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1066["version_context"], null) == null ? [] : local.m1066["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
