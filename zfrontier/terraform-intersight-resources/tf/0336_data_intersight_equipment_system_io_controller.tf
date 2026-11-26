# Sample data source intersight_equipment_system_io_controller — reads ../models/data_intersight_equipment_system_io_controller.yml
locals { m336 = yamldecode(file("${path.module}/../models/data_intersight_equipment_system_io_controller.yml"))["data_intersight_equipment_system_io_controller"] }

data "intersight_equipment_system_io_controller" "n336" {
  account_moid = try(local.m336["account_moid"], null)
  additional_properties = try(local.m336["additional_properties"], null)
  chassis_id = try(local.m336["chassis_id"], null)
  class_id = try(local.m336["class_id"], null)
  connection_path = try(local.m336["connection_path"], null)
  connection_status = try(local.m336["connection_status"], null)
  create_time = try(local.m336["create_time"], null)
  description = try(local.m336["description"], null)
  device_mo_id = try(local.m336["device_mo_id"], null)
  dn = try(local.m336["dn"], null)
  domain_group_moid = try(local.m336["domain_group_moid"], null)
  id = try(local.m336["id"], null)
  is_upgraded = try(local.m336["is_upgraded"], null)
  managing_instance = try(local.m336["managing_instance"], null)
  mod_time = try(local.m336["mod_time"], null)
  model = try(local.m336["model"], null)
  moid = try(local.m336["moid"], null)
  object_type = try(local.m336["object_type"], null)
  oper_state = try(local.m336["oper_state"], null)
  owners = try(local.m336["owners"], null)
  part_number = try(local.m336["part_number"], null)
  pid = try(local.m336["pid"], null)
  presence = try(local.m336["presence"], null)
  results = try(local.m336["results"], null)
  revision = try(local.m336["revision"], null)
  rn = try(local.m336["rn"], null)
  serial = try(local.m336["serial"], null)
  shared_scope = try(local.m336["shared_scope"], null)
  system_io_controller_id = try(local.m336["system_io_controller_id"], null)
  vendor = try(local.m336["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m336["ancestors"], null) == null ? [] : local.m336["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cmc" {
    for_each = try(local.m336["cmc"], null) == null ? [] : local.m336["cmc"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m336["equipment_chassis"], null) == null ? [] : local.m336["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m336["inventory_device_info"], null) == null ? [] : local.m336["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m336["parent"], null) == null ? [] : local.m336["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m336["permission_resources"], null) == null ? [] : local.m336["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m336["previous_fru"], null) == null ? [] : local.m336["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m336["registered_device"], null) == null ? [] : local.m336["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "shared_io_module" {
    for_each = try(local.m336["shared_io_module"], null) == null ? [] : local.m336["shared_io_module"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m336["tags"], null) == null ? [] : local.m336["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m336["version_context"], null) == null ? [] : local.m336["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
