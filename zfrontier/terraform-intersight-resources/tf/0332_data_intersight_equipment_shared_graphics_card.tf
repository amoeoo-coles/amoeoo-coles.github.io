# Sample data source intersight_equipment_shared_graphics_card — reads ../models/data_intersight_equipment_shared_graphics_card.yml
locals { m332 = yamldecode(file("${path.module}/../models/data_intersight_equipment_shared_graphics_card.yml"))["data_intersight_equipment_shared_graphics_card"] }

data "intersight_equipment_shared_graphics_card" "n332" {
  account_moid = try(local.m332["account_moid"], null)
  additional_properties = try(local.m332["additional_properties"], null)
  class_id = try(local.m332["class_id"], null)
  create_time = try(local.m332["create_time"], null)
  description = try(local.m332["description"], null)
  device_id = try(local.m332["device_id"], null)
  device_mo_id = try(local.m332["device_mo_id"], null)
  dn = try(local.m332["dn"], null)
  domain_group_moid = try(local.m332["domain_group_moid"], null)
  firmware_version = try(local.m332["firmware_version"], null)
  gpu_id = try(local.m332["gpu_id"], null)
  id = try(local.m332["id"], null)
  is_upgraded = try(local.m332["is_upgraded"], null)
  mod_time = try(local.m332["mod_time"], null)
  model = try(local.m332["model"], null)
  moid = try(local.m332["moid"], null)
  object_type = try(local.m332["object_type"], null)
  oper_reason = try(local.m332["oper_reason"], null)
  oper_state = try(local.m332["oper_state"], null)
  owners = try(local.m332["owners"], null)
  part_number = try(local.m332["part_number"], null)
  pci_slot = try(local.m332["pci_slot"], null)
  pid = try(local.m332["pid"], null)
  presence = try(local.m332["presence"], null)
  results = try(local.m332["results"], null)
  revision = try(local.m332["revision"], null)
  rn = try(local.m332["rn"], null)
  serial = try(local.m332["serial"], null)
  shared_scope = try(local.m332["shared_scope"], null)
  sub_device_id = try(local.m332["sub_device_id"], null)
  sub_vendor_id = try(local.m332["sub_vendor_id"], null)
  vendor = try(local.m332["vendor"], null)
  vendor_id = try(local.m332["vendor_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m332["ancestors"], null) == null ? [] : local.m332["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_interconnect" {
    for_each = try(local.m332["equipment_interconnect"], null) == null ? [] : local.m332["equipment_interconnect"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "graphics_cards" {
    for_each = try(local.m332["graphics_cards"], null) == null ? [] : local.m332["graphics_cards"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m332["parent"], null) == null ? [] : local.m332["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_endpoint" {
    for_each = try(local.m332["pci_endpoint"], null) == null ? [] : local.m332["pci_endpoint"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_node" {
    for_each = try(local.m332["pci_node"], null) == null ? [] : local.m332["pci_node"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m332["permission_resources"], null) == null ? [] : local.m332["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m332["previous_fru"], null) == null ? [] : local.m332["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m332["registered_device"], null) == null ? [] : local.m332["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m332["tags"], null) == null ? [] : local.m332["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m332["version_context"], null) == null ? [] : local.m332["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
