# Sample data source intersight_pci_node — reads ../models/data_intersight_pci_node.yml
locals { m1064 = yamldecode(file("${path.module}/../models/data_intersight_pci_node.yml"))["data_intersight_pci_node"] }

data "intersight_pci_node" "n1064" {
  account_moid = try(local.m1064["account_moid"], null)
  additional_properties = try(local.m1064["additional_properties"], null)
  chassis_id = try(local.m1064["chassis_id"], null)
  class_id = try(local.m1064["class_id"], null)
  create_time = try(local.m1064["create_time"], null)
  device_mo_id = try(local.m1064["device_mo_id"], null)
  dn = try(local.m1064["dn"], null)
  domain_group_moid = try(local.m1064["domain_group_moid"], null)
  firmware_version = try(local.m1064["firmware_version"], null)
  id = try(local.m1064["id"], null)
  inventory_ready = try(local.m1064["inventory_ready"], null)
  is_upgraded = try(local.m1064["is_upgraded"], null)
  mod_time = try(local.m1064["mod_time"], null)
  model = try(local.m1064["model"], null)
  moid = try(local.m1064["moid"], null)
  name = try(local.m1064["name"], null)
  nr_lifecycle = try(local.m1064["nr_lifecycle"], null)
  object_type = try(local.m1064["object_type"], null)
  oper_reason = try(local.m1064["oper_reason"], null)
  oper_state = try(local.m1064["oper_state"], null)
  owners = try(local.m1064["owners"], null)
  package_version = try(local.m1064["package_version"], null)
  presence = try(local.m1064["presence"], null)
  results = try(local.m1064["results"], null)
  revision = try(local.m1064["revision"], null)
  rn = try(local.m1064["rn"], null)
  serial = try(local.m1064["serial"], null)
  shared_scope = try(local.m1064["shared_scope"], null)
  slot_id = try(local.m1064["slot_id"], null)
  vendor = try(local.m1064["vendor"], null)
  dynamic "alarm_summary" {
    for_each = try(local.m1064["alarm_summary"], null) == null ? [] : local.m1064["alarm_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1064["ancestors"], null) == null ? [] : local.m1064["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m1064["compute_blade"], null) == null ? [] : local.m1064["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m1064["equipment_chassis"], null) == null ? [] : local.m1064["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "graphics_cards" {
    for_each = try(local.m1064["graphics_cards"], null) == null ? [] : local.m1064["graphics_cards"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "interconnects" {
    for_each = try(local.m1064["interconnects"], null) == null ? [] : local.m1064["interconnects"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1064["inventory_device_info"], null) == null ? [] : local.m1064["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "locator_led" {
    for_each = try(local.m1064["locator_led"], null) == null ? [] : local.m1064["locator_led"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1064["parent"], null) == null ? [] : local.m1064["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1064["permission_resources"], null) == null ? [] : local.m1064["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1064["previous_fru"], null) == null ? [] : local.m1064["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1064["registered_device"], null) == null ? [] : local.m1064["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "shared_graphics_cards" {
    for_each = try(local.m1064["shared_graphics_cards"], null) == null ? [] : local.m1064["shared_graphics_cards"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1064["tags"], null) == null ? [] : local.m1064["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1064["version_context"], null) == null ? [] : local.m1064["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
