# Sample data source intersight_storage_virtual_drive — reads ../models/data_intersight_storage_virtual_drive.yml
locals { m1351 = yamldecode(file("${path.module}/../models/data_intersight_storage_virtual_drive.yml"))["data_intersight_storage_virtual_drive"] }

data "intersight_storage_virtual_drive" "n1351" {
  access_policy = try(local.m1351["access_policy"], null)
  account_moid = try(local.m1351["account_moid"], null)
  actual_write_cache_policy = try(local.m1351["actual_write_cache_policy"], null)
  additional_properties = try(local.m1351["additional_properties"], null)
  available_size = try(local.m1351["available_size"], null)
  block_size = try(local.m1351["block_size"], null)
  bootable = try(local.m1351["bootable"], null)
  class_id = try(local.m1351["class_id"], null)
  config_state = try(local.m1351["config_state"], null)
  configured_write_cache_policy = try(local.m1351["configured_write_cache_policy"], null)
  connection_protocol = try(local.m1351["connection_protocol"], null)
  create_time = try(local.m1351["create_time"], null)
  device_mo_id = try(local.m1351["device_mo_id"], null)
  dn = try(local.m1351["dn"], null)
  domain_group_moid = try(local.m1351["domain_group_moid"], null)
  drive_cache = try(local.m1351["drive_cache"], null)
  drive_security = try(local.m1351["drive_security"], null)
  drive_state = try(local.m1351["drive_state"], null)
  id = try(local.m1351["id"], null)
  io_policy = try(local.m1351["io_policy"], null)
  is_upgraded = try(local.m1351["is_upgraded"], null)
  mod_time = try(local.m1351["mod_time"], null)
  model = try(local.m1351["model"], null)
  moid = try(local.m1351["moid"], null)
  name = try(local.m1351["name"], null)
  num_blocks = try(local.m1351["num_blocks"], null)
  object_type = try(local.m1351["object_type"], null)
  oper_reason = try(local.m1351["oper_reason"], null)
  oper_state = try(local.m1351["oper_state"], null)
  operability = try(local.m1351["operability"], null)
  owners = try(local.m1351["owners"], null)
  physical_block_size = try(local.m1351["physical_block_size"], null)
  presence = try(local.m1351["presence"], null)
  read_policy = try(local.m1351["read_policy"], null)
  results = try(local.m1351["results"], null)
  revision = try(local.m1351["revision"], null)
  rn = try(local.m1351["rn"], null)
  security_flags = try(local.m1351["security_flags"], null)
  serial = try(local.m1351["serial"], null)
  shared_scope = try(local.m1351["shared_scope"], null)
  size = try(local.m1351["size"], null)
  strip_size = try(local.m1351["strip_size"], null)
  type = try(local.m1351["type"], null)
  uuid = try(local.m1351["uuid"], null)
  vendor = try(local.m1351["vendor"], null)
  vendor_uuid = try(local.m1351["vendor_uuid"], null)
  virtual_drive_id = try(local.m1351["virtual_drive_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1351["ancestors"], null) == null ? [] : local.m1351["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disk_group" {
    for_each = try(local.m1351["disk_group"], null) == null ? [] : local.m1351["disk_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1351["inventory_device_info"], null) == null ? [] : local.m1351["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1351["parent"], null) == null ? [] : local.m1351["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1351["permission_resources"], null) == null ? [] : local.m1351["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_disk_usages" {
    for_each = try(local.m1351["physical_disk_usages"], null) == null ? [] : local.m1351["physical_disk_usages"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1351["previous_fru"], null) == null ? [] : local.m1351["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1351["registered_device"], null) == null ? [] : local.m1351["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_controller" {
    for_each = try(local.m1351["storage_controller"], null) == null ? [] : local.m1351["storage_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_virtual_drive_container" {
    for_each = try(local.m1351["storage_virtual_drive_container"], null) == null ? [] : local.m1351["storage_virtual_drive_container"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1351["tags"], null) == null ? [] : local.m1351["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vd_member_eps" {
    for_each = try(local.m1351["vd_member_eps"], null) == null ? [] : local.m1351["vd_member_eps"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1351["version_context"], null) == null ? [] : local.m1351["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_drive_extension" {
    for_each = try(local.m1351["virtual_drive_extension"], null) == null ? [] : local.m1351["virtual_drive_extension"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
