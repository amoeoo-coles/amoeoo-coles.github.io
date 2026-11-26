# Sample data source intersight_equipment_locator_led — reads ../models/data_intersight_equipment_locator_led.yml
locals { m323 = yamldecode(file("${path.module}/../models/data_intersight_equipment_locator_led.yml"))["data_intersight_equipment_locator_led"] }

data "intersight_equipment_locator_led" "n323" {
  account_moid = try(local.m323["account_moid"], null)
  additional_properties = try(local.m323["additional_properties"], null)
  class_id = try(local.m323["class_id"], null)
  color = try(local.m323["color"], null)
  create_time = try(local.m323["create_time"], null)
  device_mo_id = try(local.m323["device_mo_id"], null)
  dn = try(local.m323["dn"], null)
  domain_group_moid = try(local.m323["domain_group_moid"], null)
  id = try(local.m323["id"], null)
  mod_time = try(local.m323["mod_time"], null)
  moid = try(local.m323["moid"], null)
  object_type = try(local.m323["object_type"], null)
  oper_state = try(local.m323["oper_state"], null)
  owners = try(local.m323["owners"], null)
  results = try(local.m323["results"], null)
  rn = try(local.m323["rn"], null)
  shared_scope = try(local.m323["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m323["ancestors"], null) == null ? [] : local.m323["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m323["compute_blade"], null) == null ? [] : local.m323["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m323["compute_rack_unit"], null) == null ? [] : local.m323["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m323["equipment_chassis"], null) == null ? [] : local.m323["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_fex" {
    for_each = try(local.m323["equipment_fex"], null) == null ? [] : local.m323["equipment_fex"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m323["inventory_device_info"], null) == null ? [] : local.m323["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m323["network_element"], null) == null ? [] : local.m323["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_secure_router" {
    for_each = try(local.m323["network_secure_router"], null) == null ? [] : local.m323["network_secure_router"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m323["parent"], null) == null ? [] : local.m323["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_node" {
    for_each = try(local.m323["pci_node"], null) == null ? [] : local.m323["pci_node"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m323["permission_resources"], null) == null ? [] : local.m323["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m323["registered_device"], null) == null ? [] : local.m323["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_physical_disk" {
    for_each = try(local.m323["storage_physical_disk"], null) == null ? [] : local.m323["storage_physical_disk"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m323["tags"], null) == null ? [] : local.m323["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m323["version_context"], null) == null ? [] : local.m323["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
