# Sample data source intersight_graphics_controller — reads ../models/data_intersight_graphics_controller.yml
locals { m517 = yamldecode(file("${path.module}/../models/data_intersight_graphics_controller.yml"))["data_intersight_graphics_controller"] }

data "intersight_graphics_controller" "n517" {
  account_moid = try(local.m517["account_moid"], null)
  additional_properties = try(local.m517["additional_properties"], null)
  class_id = try(local.m517["class_id"], null)
  controller_id = try(local.m517["controller_id"], null)
  create_time = try(local.m517["create_time"], null)
  device_mo_id = try(local.m517["device_mo_id"], null)
  dn = try(local.m517["dn"], null)
  domain_group_moid = try(local.m517["domain_group_moid"], null)
  id = try(local.m517["id"], null)
  is_upgraded = try(local.m517["is_upgraded"], null)
  mod_time = try(local.m517["mod_time"], null)
  model = try(local.m517["model"], null)
  moid = try(local.m517["moid"], null)
  object_type = try(local.m517["object_type"], null)
  owners = try(local.m517["owners"], null)
  pci_addr = try(local.m517["pci_addr"], null)
  pci_slot = try(local.m517["pci_slot"], null)
  presence = try(local.m517["presence"], null)
  results = try(local.m517["results"], null)
  revision = try(local.m517["revision"], null)
  rn = try(local.m517["rn"], null)
  serial = try(local.m517["serial"], null)
  shared_scope = try(local.m517["shared_scope"], null)
  vendor = try(local.m517["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m517["ancestors"], null) == null ? [] : local.m517["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "graphics_card" {
    for_each = try(local.m517["graphics_card"], null) == null ? [] : local.m517["graphics_card"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m517["inventory_device_info"], null) == null ? [] : local.m517["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m517["parent"], null) == null ? [] : local.m517["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m517["permission_resources"], null) == null ? [] : local.m517["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m517["previous_fru"], null) == null ? [] : local.m517["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m517["registered_device"], null) == null ? [] : local.m517["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m517["tags"], null) == null ? [] : local.m517["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m517["version_context"], null) == null ? [] : local.m517["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
