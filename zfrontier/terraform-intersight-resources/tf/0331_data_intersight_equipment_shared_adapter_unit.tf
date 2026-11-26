# Sample data source intersight_equipment_shared_adapter_unit — reads ../models/data_intersight_equipment_shared_adapter_unit.yml
locals { m331 = yamldecode(file("${path.module}/../models/data_intersight_equipment_shared_adapter_unit.yml"))["data_intersight_equipment_shared_adapter_unit"] }

data "intersight_equipment_shared_adapter_unit" "n331" {
  account_moid = try(local.m331["account_moid"], null)
  adapter_id = try(local.m331["adapter_id"], null)
  additional_properties = try(local.m331["additional_properties"], null)
  class_id = try(local.m331["class_id"], null)
  create_time = try(local.m331["create_time"], null)
  device_mo_id = try(local.m331["device_mo_id"], null)
  dn = try(local.m331["dn"], null)
  domain_group_moid = try(local.m331["domain_group_moid"], null)
  firmware_version = try(local.m331["firmware_version"], null)
  id = try(local.m331["id"], null)
  is_upgraded = try(local.m331["is_upgraded"], null)
  mod_time = try(local.m331["mod_time"], null)
  model = try(local.m331["model"], null)
  moid = try(local.m331["moid"], null)
  object_type = try(local.m331["object_type"], null)
  oper_reason = try(local.m331["oper_reason"], null)
  oper_state = try(local.m331["oper_state"], null)
  owners = try(local.m331["owners"], null)
  part_number = try(local.m331["part_number"], null)
  pci_slot = try(local.m331["pci_slot"], null)
  presence = try(local.m331["presence"], null)
  results = try(local.m331["results"], null)
  revision = try(local.m331["revision"], null)
  rn = try(local.m331["rn"], null)
  serial = try(local.m331["serial"], null)
  shared_scope = try(local.m331["shared_scope"], null)
  vendor = try(local.m331["vendor"], null)
  dynamic "adapter_units" {
    for_each = try(local.m331["adapter_units"], null) == null ? [] : local.m331["adapter_units"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m331["ancestors"], null) == null ? [] : local.m331["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_expander_module" {
    for_each = try(local.m331["equipment_expander_module"], null) == null ? [] : local.m331["equipment_expander_module"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m331["parent"], null) == null ? [] : local.m331["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_endpoint" {
    for_each = try(local.m331["pci_endpoint"], null) == null ? [] : local.m331["pci_endpoint"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m331["permission_resources"], null) == null ? [] : local.m331["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m331["previous_fru"], null) == null ? [] : local.m331["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m331["registered_device"], null) == null ? [] : local.m331["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m331["tags"], null) == null ? [] : local.m331["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m331["version_context"], null) == null ? [] : local.m331["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
