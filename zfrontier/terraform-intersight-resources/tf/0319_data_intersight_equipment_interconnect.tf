# Sample data source intersight_equipment_interconnect — reads ../models/data_intersight_equipment_interconnect.yml
locals { m319 = yamldecode(file("${path.module}/../models/data_intersight_equipment_interconnect.yml"))["data_intersight_equipment_interconnect"] }

data "intersight_equipment_interconnect" "n319" {
  account_moid = try(local.m319["account_moid"], null)
  additional_properties = try(local.m319["additional_properties"], null)
  class_id = try(local.m319["class_id"], null)
  create_time = try(local.m319["create_time"], null)
  device_mo_id = try(local.m319["device_mo_id"], null)
  dn = try(local.m319["dn"], null)
  domain_group_moid = try(local.m319["domain_group_moid"], null)
  id = try(local.m319["id"], null)
  interconnect_id = try(local.m319["interconnect_id"], null)
  interconnect_type = try(local.m319["interconnect_type"], null)
  is_upgraded = try(local.m319["is_upgraded"], null)
  mod_time = try(local.m319["mod_time"], null)
  model = try(local.m319["model"], null)
  moid = try(local.m319["moid"], null)
  object_type = try(local.m319["object_type"], null)
  owners = try(local.m319["owners"], null)
  presence = try(local.m319["presence"], null)
  results = try(local.m319["results"], null)
  revision = try(local.m319["revision"], null)
  rn = try(local.m319["rn"], null)
  serial = try(local.m319["serial"], null)
  shared_scope = try(local.m319["shared_scope"], null)
  vendor = try(local.m319["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m319["ancestors"], null) == null ? [] : local.m319["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_board" {
    for_each = try(local.m319["compute_board"], null) == null ? [] : local.m319["compute_board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "interconnected_graphics_cards" {
    for_each = try(local.m319["interconnected_graphics_cards"], null) == null ? [] : local.m319["interconnected_graphics_cards"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "interconnected_shared_graphics_cards" {
    for_each = try(local.m319["interconnected_shared_graphics_cards"], null) == null ? [] : local.m319["interconnected_shared_graphics_cards"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m319["parent"], null) == null ? [] : local.m319["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_node" {
    for_each = try(local.m319["pci_node"], null) == null ? [] : local.m319["pci_node"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m319["permission_resources"], null) == null ? [] : local.m319["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m319["previous_fru"], null) == null ? [] : local.m319["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m319["registered_device"], null) == null ? [] : local.m319["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m319["tags"], null) == null ? [] : local.m319["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m319["version_context"], null) == null ? [] : local.m319["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
