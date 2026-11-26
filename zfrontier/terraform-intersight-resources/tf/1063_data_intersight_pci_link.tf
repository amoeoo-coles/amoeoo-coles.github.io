# Sample data source intersight_pci_link — reads ../models/data_intersight_pci_link.yml
locals { m1063 = yamldecode(file("${path.module}/../models/data_intersight_pci_link.yml"))["data_intersight_pci_link"] }

data "intersight_pci_link" "n1063" {
  account_moid = try(local.m1063["account_moid"], null)
  adapter = try(local.m1063["adapter"], null)
  additional_properties = try(local.m1063["additional_properties"], null)
  class_id = try(local.m1063["class_id"], null)
  create_time = try(local.m1063["create_time"], null)
  device_mo_id = try(local.m1063["device_mo_id"], null)
  dn = try(local.m1063["dn"], null)
  domain_group_moid = try(local.m1063["domain_group_moid"], null)
  id = try(local.m1063["id"], null)
  is_upgraded = try(local.m1063["is_upgraded"], null)
  link_speed = try(local.m1063["link_speed"], null)
  link_status = try(local.m1063["link_status"], null)
  link_width = try(local.m1063["link_width"], null)
  mod_time = try(local.m1063["mod_time"], null)
  model = try(local.m1063["model"], null)
  moid = try(local.m1063["moid"], null)
  object_type = try(local.m1063["object_type"], null)
  owners = try(local.m1063["owners"], null)
  pci_slot = try(local.m1063["pci_slot"], null)
  presence = try(local.m1063["presence"], null)
  results = try(local.m1063["results"], null)
  revision = try(local.m1063["revision"], null)
  rn = try(local.m1063["rn"], null)
  serial = try(local.m1063["serial"], null)
  shared_scope = try(local.m1063["shared_scope"], null)
  slot_status = try(local.m1063["slot_status"], null)
  vendor = try(local.m1063["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1063["ancestors"], null) == null ? [] : local.m1063["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1063["inventory_device_info"], null) == null ? [] : local.m1063["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1063["parent"], null) == null ? [] : local.m1063["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_switch" {
    for_each = try(local.m1063["pci_switch"], null) == null ? [] : local.m1063["pci_switch"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1063["permission_resources"], null) == null ? [] : local.m1063["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1063["previous_fru"], null) == null ? [] : local.m1063["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1063["registered_device"], null) == null ? [] : local.m1063["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1063["tags"], null) == null ? [] : local.m1063["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1063["version_context"], null) == null ? [] : local.m1063["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
