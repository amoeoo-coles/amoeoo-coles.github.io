# Sample data source intersight_storage_physical_disk — reads ../models/data_intersight_storage_physical_disk.yml
locals { m1309 = yamldecode(file("${path.module}/../models/data_intersight_storage_physical_disk.yml"))["data_intersight_storage_physical_disk"] }

data "intersight_storage_physical_disk" "n1309" {
  account_moid = try(local.m1309["account_moid"], null)
  additional_properties = try(local.m1309["additional_properties"], null)
  background_operations = try(local.m1309["background_operations"], null)
  block_size = try(local.m1309["block_size"], null)
  bootable = try(local.m1309["bootable"], null)
  class_id = try(local.m1309["class_id"], null)
  configuration_checkpoint = try(local.m1309["configuration_checkpoint"], null)
  configuration_state = try(local.m1309["configuration_state"], null)
  create_time = try(local.m1309["create_time"], null)
  description = try(local.m1309["description"], null)
  device_mo_id = try(local.m1309["device_mo_id"], null)
  disabled_for_removal = try(local.m1309["disabled_for_removal"], null)
  discovered_path = try(local.m1309["discovered_path"], null)
  disk_id = try(local.m1309["disk_id"], null)
  disk_state = try(local.m1309["disk_state"], null)
  dn = try(local.m1309["dn"], null)
  domain_group_moid = try(local.m1309["domain_group_moid"], null)
  drive_firmware = try(local.m1309["drive_firmware"], null)
  drive_state = try(local.m1309["drive_state"], null)
  encryption_status = try(local.m1309["encryption_status"], null)
  failure_predicted = try(local.m1309["failure_predicted"], null)
  fde_capable = try(local.m1309["fde_capable"], null)
  health = try(local.m1309["health"], null)
  health_message = try(local.m1309["health_message"], null)
  health_resolution = try(local.m1309["health_resolution"], null)
  hot_spare_type = try(local.m1309["hot_spare_type"], null)
  id = try(local.m1309["id"], null)
  indicator_led = try(local.m1309["indicator_led"], null)
  is_platform_supported = try(local.m1309["is_platform_supported"], null)
  is_upgraded = try(local.m1309["is_upgraded"], null)
  link_speed = try(local.m1309["link_speed"], null)
  link_state = try(local.m1309["link_state"], null)
  maximum_operating_temperature = try(local.m1309["maximum_operating_temperature"], null)
  media_error_count = try(local.m1309["media_error_count"], null)
  mod_time = try(local.m1309["mod_time"], null)
  model = try(local.m1309["model"], null)
  moid = try(local.m1309["moid"], null)
  name = try(local.m1309["name"], null)
  non_coerced_size_bytes = try(local.m1309["non_coerced_size_bytes"], null)
  num_blocks = try(local.m1309["num_blocks"], null)
  object_type = try(local.m1309["object_type"], null)
  oper_power_state = try(local.m1309["oper_power_state"], null)
  oper_qualifier_reason = try(local.m1309["oper_qualifier_reason"], null)
  oper_reason = try(local.m1309["oper_reason"], null)
  operability = try(local.m1309["operability"], null)
  operating_temperature = try(local.m1309["operating_temperature"], null)
  owners = try(local.m1309["owners"], null)
  part_number = try(local.m1309["part_number"], null)
  percent_life_left = try(local.m1309["percent_life_left"], null)
  percent_reserved_capacity_consumed = try(local.m1309["percent_reserved_capacity_consumed"], null)
  performance_percent = try(local.m1309["performance_percent"], null)
  physical_block_size = try(local.m1309["physical_block_size"], null)
  pid = try(local.m1309["pid"], null)
  power_cycle_count = try(local.m1309["power_cycle_count"], null)
  power_on_hours = try(local.m1309["power_on_hours"], null)
  power_on_hours_percentage = try(local.m1309["power_on_hours_percentage"], null)
  predicted_media_life_left_percent = try(local.m1309["predicted_media_life_left_percent"], null)
  predictive_failure_count = try(local.m1309["predictive_failure_count"], null)
  presence = try(local.m1309["presence"], null)
  protocol = try(local.m1309["protocol"], null)
  raw_size = try(local.m1309["raw_size"], null)
  read_error_count_threshold = try(local.m1309["read_error_count_threshold"], null)
  read_io_error_count = try(local.m1309["read_io_error_count"], null)
  results = try(local.m1309["results"], null)
  revision = try(local.m1309["revision"], null)
  rn = try(local.m1309["rn"], null)
  secured = try(local.m1309["secured"], null)
  serial = try(local.m1309["serial"], null)
  shared_scope = try(local.m1309["shared_scope"], null)
  size = try(local.m1309["size"], null)
  thermal = try(local.m1309["thermal"], null)
  threshold_operating_temperature = try(local.m1309["threshold_operating_temperature"], null)
  type = try(local.m1309["type"], null)
  variant_type = try(local.m1309["variant_type"], null)
  vendor = try(local.m1309["vendor"], null)
  wear_status_in_days = try(local.m1309["wear_status_in_days"], null)
  write_error_count_threshold = try(local.m1309["write_error_count_threshold"], null)
  write_io_error_count = try(local.m1309["write_io_error_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m1309["ancestors"], null) == null ? [] : local.m1309["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1309["inventory_device_info"], null) == null ? [] : local.m1309["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "locator_led" {
    for_each = try(local.m1309["locator_led"], null) == null ? [] : local.m1309["locator_led"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1309["parent"], null) == null ? [] : local.m1309["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1309["permission_resources"], null) == null ? [] : local.m1309["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_disk_extensions" {
    for_each = try(local.m1309["physical_disk_extensions"], null) == null ? [] : local.m1309["physical_disk_extensions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1309["previous_fru"], null) == null ? [] : local.m1309["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1309["registered_device"], null) == null ? [] : local.m1309["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "running_firmware" {
    for_each = try(local.m1309["running_firmware"], null) == null ? [] : local.m1309["running_firmware"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sas_ports" {
    for_each = try(local.m1309["sas_ports"], null) == null ? [] : local.m1309["sas_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_controller" {
    for_each = try(local.m1309["storage_controller"], null) == null ? [] : local.m1309["storage_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_enclosure" {
    for_each = try(local.m1309["storage_enclosure"], null) == null ? [] : local.m1309["storage_enclosure"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1309["tags"], null) == null ? [] : local.m1309["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1309["version_context"], null) == null ? [] : local.m1309["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
