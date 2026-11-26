# Sample data source intersight_equipment_expander_module — reads ../models/data_intersight_equipment_expander_module.yml
locals { m308 = yamldecode(file("${path.module}/../models/data_intersight_equipment_expander_module.yml"))["data_intersight_equipment_expander_module"] }

data "intersight_equipment_expander_module" "n308" {
  account_moid = try(local.m308["account_moid"], null)
  additional_properties = try(local.m308["additional_properties"], null)
  class_id = try(local.m308["class_id"], null)
  create_time = try(local.m308["create_time"], null)
  device_mo_id = try(local.m308["device_mo_id"], null)
  dn = try(local.m308["dn"], null)
  domain_group_moid = try(local.m308["domain_group_moid"], null)
  firmware_version = try(local.m308["firmware_version"], null)
  id = try(local.m308["id"], null)
  inventory_ready = try(local.m308["inventory_ready"], null)
  is_upgraded = try(local.m308["is_upgraded"], null)
  mod_time = try(local.m308["mod_time"], null)
  model = try(local.m308["model"], null)
  module_id = try(local.m308["module_id"], null)
  moid = try(local.m308["moid"], null)
  object_type = try(local.m308["object_type"], null)
  oper_reason = try(local.m308["oper_reason"], null)
  oper_state = try(local.m308["oper_state"], null)
  owners = try(local.m308["owners"], null)
  part_number = try(local.m308["part_number"], null)
  presence = try(local.m308["presence"], null)
  results = try(local.m308["results"], null)
  revision = try(local.m308["revision"], null)
  rn = try(local.m308["rn"], null)
  serial = try(local.m308["serial"], null)
  shared_scope = try(local.m308["shared_scope"], null)
  side = try(local.m308["side"], null)
  vendor = try(local.m308["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m308["ancestors"], null) == null ? [] : local.m308["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m308["equipment_chassis"], null) == null ? [] : local.m308["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fan_modules" {
    for_each = try(local.m308["fan_modules"], null) == null ? [] : local.m308["fan_modules"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m308["parent"], null) == null ? [] : local.m308["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_switches" {
    for_each = try(local.m308["pci_switches"], null) == null ? [] : local.m308["pci_switches"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_zones" {
    for_each = try(local.m308["pci_zones"], null) == null ? [] : local.m308["pci_zones"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m308["permission_resources"], null) == null ? [] : local.m308["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_device_registration" {
    for_each = try(local.m308["physical_device_registration"], null) == null ? [] : local.m308["physical_device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m308["previous_fru"], null) == null ? [] : local.m308["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m308["registered_device"], null) == null ? [] : local.m308["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "shared_adapter_units" {
    for_each = try(local.m308["shared_adapter_units"], null) == null ? [] : local.m308["shared_adapter_units"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m308["tags"], null) == null ? [] : local.m308["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m308["version_context"], null) == null ? [] : local.m308["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
