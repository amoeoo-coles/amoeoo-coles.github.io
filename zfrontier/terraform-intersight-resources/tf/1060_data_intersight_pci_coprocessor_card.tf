# Sample data source intersight_pci_coprocessor_card — reads ../models/data_intersight_pci_coprocessor_card.yml
locals { m1060 = yamldecode(file("${path.module}/../models/data_intersight_pci_coprocessor_card.yml"))["data_intersight_pci_coprocessor_card"] }

data "intersight_pci_coprocessor_card" "n1060" {
  account_moid = try(local.m1060["account_moid"], null)
  additional_properties = try(local.m1060["additional_properties"], null)
  card_id = try(local.m1060["card_id"], null)
  class_id = try(local.m1060["class_id"], null)
  create_time = try(local.m1060["create_time"], null)
  device_mo_id = try(local.m1060["device_mo_id"], null)
  dn = try(local.m1060["dn"], null)
  domain_group_moid = try(local.m1060["domain_group_moid"], null)
  id = try(local.m1060["id"], null)
  is_upgraded = try(local.m1060["is_upgraded"], null)
  mod_time = try(local.m1060["mod_time"], null)
  model = try(local.m1060["model"], null)
  moid = try(local.m1060["moid"], null)
  object_type = try(local.m1060["object_type"], null)
  owners = try(local.m1060["owners"], null)
  pci_slot = try(local.m1060["pci_slot"], null)
  presence = try(local.m1060["presence"], null)
  results = try(local.m1060["results"], null)
  revision = try(local.m1060["revision"], null)
  rn = try(local.m1060["rn"], null)
  serial = try(local.m1060["serial"], null)
  shared_scope = try(local.m1060["shared_scope"], null)
  vendor = try(local.m1060["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1060["ancestors"], null) == null ? [] : local.m1060["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_board" {
    for_each = try(local.m1060["compute_board"], null) == null ? [] : local.m1060["compute_board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1060["inventory_device_info"], null) == null ? [] : local.m1060["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1060["parent"], null) == null ? [] : local.m1060["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1060["permission_resources"], null) == null ? [] : local.m1060["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1060["previous_fru"], null) == null ? [] : local.m1060["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1060["registered_device"], null) == null ? [] : local.m1060["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1060["tags"], null) == null ? [] : local.m1060["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1060["version_context"], null) == null ? [] : local.m1060["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
