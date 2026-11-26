# Sample data source intersight_pci_device — reads ../models/data_intersight_pci_device.yml
locals { m1061 = yamldecode(file("${path.module}/../models/data_intersight_pci_device.yml"))["data_intersight_pci_device"] }

data "intersight_pci_device" "n1061" {
  account_moid = try(local.m1061["account_moid"], null)
  additional_properties = try(local.m1061["additional_properties"], null)
  class_id = try(local.m1061["class_id"], null)
  create_time = try(local.m1061["create_time"], null)
  device_id = try(local.m1061["device_id"], null)
  device_mo_id = try(local.m1061["device_mo_id"], null)
  dn = try(local.m1061["dn"], null)
  domain_group_moid = try(local.m1061["domain_group_moid"], null)
  firmware_version = try(local.m1061["firmware_version"], null)
  id = try(local.m1061["id"], null)
  is_upgraded = try(local.m1061["is_upgraded"], null)
  mod_time = try(local.m1061["mod_time"], null)
  model = try(local.m1061["model"], null)
  moid = try(local.m1061["moid"], null)
  object_type = try(local.m1061["object_type"], null)
  owners = try(local.m1061["owners"], null)
  pid = try(local.m1061["pid"], null)
  presence = try(local.m1061["presence"], null)
  results = try(local.m1061["results"], null)
  revision = try(local.m1061["revision"], null)
  rn = try(local.m1061["rn"], null)
  serial = try(local.m1061["serial"], null)
  shared_scope = try(local.m1061["shared_scope"], null)
  slot_id = try(local.m1061["slot_id"], null)
  vendor = try(local.m1061["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1061["ancestors"], null) == null ? [] : local.m1061["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m1061["compute_blade"], null) == null ? [] : local.m1061["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m1061["compute_rack_unit"], null) == null ? [] : local.m1061["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "graphics_cards" {
    for_each = try(local.m1061["graphics_cards"], null) == null ? [] : local.m1061["graphics_cards"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1061["inventory_device_info"], null) == null ? [] : local.m1061["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1061["parent"], null) == null ? [] : local.m1061["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1061["permission_resources"], null) == null ? [] : local.m1061["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1061["previous_fru"], null) == null ? [] : local.m1061["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1061["registered_device"], null) == null ? [] : local.m1061["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1061["tags"], null) == null ? [] : local.m1061["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1061["version_context"], null) == null ? [] : local.m1061["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
