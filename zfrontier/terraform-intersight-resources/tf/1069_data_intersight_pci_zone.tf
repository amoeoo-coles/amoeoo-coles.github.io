# Sample data source intersight_pci_zone — reads ../models/data_intersight_pci_zone.yml
locals { m1069 = yamldecode(file("${path.module}/../models/data_intersight_pci_zone.yml"))["data_intersight_pci_zone"] }

data "intersight_pci_zone" "n1069" {
  account_moid = try(local.m1069["account_moid"], null)
  additional_properties = try(local.m1069["additional_properties"], null)
  class_id = try(local.m1069["class_id"], null)
  create_time = try(local.m1069["create_time"], null)
  device_mo_id = try(local.m1069["device_mo_id"], null)
  dn = try(local.m1069["dn"], null)
  domain_group_moid = try(local.m1069["domain_group_moid"], null)
  id = try(local.m1069["id"], null)
  mod_time = try(local.m1069["mod_time"], null)
  moid = try(local.m1069["moid"], null)
  name = try(local.m1069["name"], null)
  object_type = try(local.m1069["object_type"], null)
  oper_reason = try(local.m1069["oper_reason"], null)
  oper_state = try(local.m1069["oper_state"], null)
  owners = try(local.m1069["owners"], null)
  results = try(local.m1069["results"], null)
  rn = try(local.m1069["rn"], null)
  shared_scope = try(local.m1069["shared_scope"], null)
  zone_id = try(local.m1069["zone_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1069["ancestors"], null) == null ? [] : local.m1069["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_expander_module" {
    for_each = try(local.m1069["equipment_expander_module"], null) == null ? [] : local.m1069["equipment_expander_module"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1069["inventory_device_info"], null) == null ? [] : local.m1069["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1069["parent"], null) == null ? [] : local.m1069["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_endpoints" {
    for_each = try(local.m1069["pci_endpoints"], null) == null ? [] : local.m1069["pci_endpoints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1069["permission_resources"], null) == null ? [] : local.m1069["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1069["registered_device"], null) == null ? [] : local.m1069["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1069["tags"], null) == null ? [] : local.m1069["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1069["version_context"], null) == null ? [] : local.m1069["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
