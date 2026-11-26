# Sample data source intersight_pci_slot — reads ../models/data_intersight_pci_slot.yml
locals { m1067 = yamldecode(file("${path.module}/../models/data_intersight_pci_slot.yml"))["data_intersight_pci_slot"] }

data "intersight_pci_slot" "n1067" {
  account_moid = try(local.m1067["account_moid"], null)
  additional_properties = try(local.m1067["additional_properties"], null)
  class_id = try(local.m1067["class_id"], null)
  create_time = try(local.m1067["create_time"], null)
  device_mo_id = try(local.m1067["device_mo_id"], null)
  dn = try(local.m1067["dn"], null)
  domain_group_moid = try(local.m1067["domain_group_moid"], null)
  id = try(local.m1067["id"], null)
  is_upgraded = try(local.m1067["is_upgraded"], null)
  mod_time = try(local.m1067["mod_time"], null)
  model = try(local.m1067["model"], null)
  moid = try(local.m1067["moid"], null)
  object_type = try(local.m1067["object_type"], null)
  owners = try(local.m1067["owners"], null)
  presence = try(local.m1067["presence"], null)
  results = try(local.m1067["results"], null)
  revision = try(local.m1067["revision"], null)
  rn = try(local.m1067["rn"], null)
  serial = try(local.m1067["serial"], null)
  shared_scope = try(local.m1067["shared_scope"], null)
  slot_id = try(local.m1067["slot_id"], null)
  vendor = try(local.m1067["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1067["ancestors"], null) == null ? [] : local.m1067["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m1067["compute_rack_unit"], null) == null ? [] : local.m1067["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1067["parent"], null) == null ? [] : local.m1067["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1067["permission_resources"], null) == null ? [] : local.m1067["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1067["previous_fru"], null) == null ? [] : local.m1067["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1067["registered_device"], null) == null ? [] : local.m1067["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1067["tags"], null) == null ? [] : local.m1067["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1067["version_context"], null) == null ? [] : local.m1067["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
