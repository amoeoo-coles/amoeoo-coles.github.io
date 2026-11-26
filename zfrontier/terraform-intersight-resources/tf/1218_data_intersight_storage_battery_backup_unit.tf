# Sample data source intersight_storage_battery_backup_unit — reads ../models/data_intersight_storage_battery_backup_unit.yml
locals { m1218 = yamldecode(file("${path.module}/../models/data_intersight_storage_battery_backup_unit.yml"))["data_intersight_storage_battery_backup_unit"] }

data "intersight_storage_battery_backup_unit" "n1218" {
  account_moid = try(local.m1218["account_moid"], null)
  additional_properties = try(local.m1218["additional_properties"], null)
  capacitance_in_percent = try(local.m1218["capacitance_in_percent"], null)
  charging_state = try(local.m1218["charging_state"], null)
  class_id = try(local.m1218["class_id"], null)
  create_time = try(local.m1218["create_time"], null)
  current_in_amps = try(local.m1218["current_in_amps"], null)
  design_capacity_in_joules = try(local.m1218["design_capacity_in_joules"], null)
  design_voltage_in_volts = try(local.m1218["design_voltage_in_volts"], null)
  device_mo_id = try(local.m1218["device_mo_id"], null)
  device_name = try(local.m1218["device_name"], null)
  dn = try(local.m1218["dn"], null)
  domain_group_moid = try(local.m1218["domain_group_moid"], null)
  id = try(local.m1218["id"], null)
  is_battery_present = try(local.m1218["is_battery_present"], null)
  is_capacitor = try(local.m1218["is_capacitor"], null)
  is_learn_cycle_requested = try(local.m1218["is_learn_cycle_requested"], null)
  is_learn_cycle_transparent = try(local.m1218["is_learn_cycle_transparent"], null)
  is_temperature_high = try(local.m1218["is_temperature_high"], null)
  is_upgraded = try(local.m1218["is_upgraded"], null)
  is_voltage_low = try(local.m1218["is_voltage_low"], null)
  learn_cycle_progress_end_time_stamp = try(local.m1218["learn_cycle_progress_end_time_stamp"], null)
  learn_cycle_progress_start_time_stamp = try(local.m1218["learn_cycle_progress_start_time_stamp"], null)
  learn_cycle_progress_status = try(local.m1218["learn_cycle_progress_status"], null)
  learn_mode = try(local.m1218["learn_mode"], null)
  manufacturing_date = try(local.m1218["manufacturing_date"], null)
  mod_time = try(local.m1218["mod_time"], null)
  model = try(local.m1218["model"], null)
  module_version = try(local.m1218["module_version"], null)
  moid = try(local.m1218["moid"], null)
  next_learn_cycle_time_stamp = try(local.m1218["next_learn_cycle_time_stamp"], null)
  object_type = try(local.m1218["object_type"], null)
  owners = try(local.m1218["owners"], null)
  pack_energy_in_joules = try(local.m1218["pack_energy_in_joules"], null)
  presence = try(local.m1218["presence"], null)
  remaining_pool_space_in_percent = try(local.m1218["remaining_pool_space_in_percent"], null)
  results = try(local.m1218["results"], null)
  revision = try(local.m1218["revision"], null)
  rn = try(local.m1218["rn"], null)
  serial = try(local.m1218["serial"], null)
  shared_scope = try(local.m1218["shared_scope"], null)
  status = try(local.m1218["status"], null)
  temperature_in_cel = try(local.m1218["temperature_in_cel"], null)
  type = try(local.m1218["type"], null)
  vendor = try(local.m1218["vendor"], null)
  voltage_in_volts = try(local.m1218["voltage_in_volts"], null)
  dynamic "ancestors" {
    for_each = try(local.m1218["ancestors"], null) == null ? [] : local.m1218["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1218["inventory_device_info"], null) == null ? [] : local.m1218["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1218["parent"], null) == null ? [] : local.m1218["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1218["permission_resources"], null) == null ? [] : local.m1218["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1218["previous_fru"], null) == null ? [] : local.m1218["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1218["registered_device"], null) == null ? [] : local.m1218["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_controller" {
    for_each = try(local.m1218["storage_controller"], null) == null ? [] : local.m1218["storage_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1218["tags"], null) == null ? [] : local.m1218["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1218["version_context"], null) == null ? [] : local.m1218["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
