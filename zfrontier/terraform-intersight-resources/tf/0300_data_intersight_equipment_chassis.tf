# Sample data source intersight_equipment_chassis — reads ../models/data_intersight_equipment_chassis.yml
locals { m300 = yamldecode(file("${path.module}/../models/data_intersight_equipment_chassis.yml"))["data_intersight_equipment_chassis"] }

data "intersight_equipment_chassis" "n300" {
  account_moid = try(local.m300["account_moid"], null)
  additional_properties = try(local.m300["additional_properties"], null)
  chassis_id = try(local.m300["chassis_id"], null)
  chassis_profile = try(local.m300["chassis_profile"], null)
  class_id = try(local.m300["class_id"], null)
  connection_path = try(local.m300["connection_path"], null)
  connection_status = try(local.m300["connection_status"], null)
  create_time = try(local.m300["create_time"], null)
  description = try(local.m300["description"], null)
  device_mo_id = try(local.m300["device_mo_id"], null)
  dn = try(local.m300["dn"], null)
  domain_group_moid = try(local.m300["domain_group_moid"], null)
  fault_summary = try(local.m300["fault_summary"], null)
  id = try(local.m300["id"], null)
  is_upgraded = try(local.m300["is_upgraded"], null)
  management_mode = try(local.m300["management_mode"], null)
  mod_time = try(local.m300["mod_time"], null)
  model = try(local.m300["model"], null)
  moid = try(local.m300["moid"], null)
  name = try(local.m300["name"], null)
  object_type = try(local.m300["object_type"], null)
  oper_reason = try(local.m300["oper_reason"], null)
  oper_state = try(local.m300["oper_state"], null)
  owners = try(local.m300["owners"], null)
  package_version = try(local.m300["package_version"], null)
  part_number = try(local.m300["part_number"], null)
  peer_interface_compatibility_issue_count = try(local.m300["peer_interface_compatibility_issue_count"], null)
  pid = try(local.m300["pid"], null)
  platform_type = try(local.m300["platform_type"], null)
  presence = try(local.m300["presence"], null)
  product_name = try(local.m300["product_name"], null)
  results = try(local.m300["results"], null)
  revision = try(local.m300["revision"], null)
  rn = try(local.m300["rn"], null)
  serial = try(local.m300["serial"], null)
  shared_scope = try(local.m300["shared_scope"], null)
  sku = try(local.m300["sku"], null)
  user_label = try(local.m300["user_label"], null)
  vendor = try(local.m300["vendor"], null)
  vid = try(local.m300["vid"], null)
  dynamic "alarm_summary" {
    for_each = try(local.m300["alarm_summary"], null) == null ? [] : local.m300["alarm_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m300["ancestors"], null) == null ? [] : local.m300["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_location" {
    for_each = try(local.m300["assigned_location"], null) == null ? [] : local.m300["assigned_location"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "blades" {
    for_each = try(local.m300["blades"], null) == null ? [] : local.m300["blades"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "expander_modules" {
    for_each = try(local.m300["expander_modules"], null) == null ? [] : local.m300["expander_modules"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fan_control" {
    for_each = try(local.m300["fan_control"], null) == null ? [] : local.m300["fan_control"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fanmodules" {
    for_each = try(local.m300["fanmodules"], null) == null ? [] : local.m300["fanmodules"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m300["inventory_device_info"], null) == null ? [] : local.m300["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ioms" {
    for_each = try(local.m300["ioms"], null) == null ? [] : local.m300["ioms"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "location_details" {
    for_each = try(local.m300["location_details"], null) == null ? [] : local.m300["location_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "locator_led" {
    for_each = try(local.m300["locator_led"], null) == null ? [] : local.m300["locator_led"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "management_interface" {
    for_each = try(local.m300["management_interface"], null) == null ? [] : local.m300["management_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_elements" {
    for_each = try(local.m300["network_elements"], null) == null ? [] : local.m300["network_elements"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "operations" {
    for_each = try(local.m300["operations"], null) == null ? [] : local.m300["operations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m300["parent"], null) == null ? [] : local.m300["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_nodes" {
    for_each = try(local.m300["pci_nodes"], null) == null ? [] : local.m300["pci_nodes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m300["permission_resources"], null) == null ? [] : local.m300["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "power_control_state" {
    for_each = try(local.m300["power_control_state"], null) == null ? [] : local.m300["power_control_state"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m300["previous_fru"], null) == null ? [] : local.m300["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "psu_control" {
    for_each = try(local.m300["psu_control"], null) == null ? [] : local.m300["psu_control"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "psus" {
    for_each = try(local.m300["psus"], null) == null ? [] : local.m300["psus"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m300["registered_device"], null) == null ? [] : local.m300["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sasexpanders" {
    for_each = try(local.m300["sasexpanders"], null) == null ? [] : local.m300["sasexpanders"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "secure_routers" {
    for_each = try(local.m300["secure_routers"], null) == null ? [] : local.m300["secure_routers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "siocs" {
    for_each = try(local.m300["siocs"], null) == null ? [] : local.m300["siocs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_enclosures" {
    for_each = try(local.m300["storage_enclosures"], null) == null ? [] : local.m300["storage_enclosures"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m300["tags"], null) == null ? [] : local.m300["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m300["version_context"], null) == null ? [] : local.m300["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_drive_container" {
    for_each = try(local.m300["virtual_drive_container"], null) == null ? [] : local.m300["virtual_drive_container"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
