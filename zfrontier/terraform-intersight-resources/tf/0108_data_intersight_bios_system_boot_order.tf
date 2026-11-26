# Sample data source intersight_bios_system_boot_order — reads ../models/data_intersight_bios_system_boot_order.yml
locals { m108 = yamldecode(file("${path.module}/../models/data_intersight_bios_system_boot_order.yml"))["data_intersight_bios_system_boot_order"] }

data "intersight_bios_system_boot_order" "n108" {
  account_moid = try(local.m108["account_moid"], null)
  additional_properties = try(local.m108["additional_properties"], null)
  boot_mode = try(local.m108["boot_mode"], null)
  class_id = try(local.m108["class_id"], null)
  create_time = try(local.m108["create_time"], null)
  device_mo_id = try(local.m108["device_mo_id"], null)
  dn = try(local.m108["dn"], null)
  domain_group_moid = try(local.m108["domain_group_moid"], null)
  id = try(local.m108["id"], null)
  is_upgraded = try(local.m108["is_upgraded"], null)
  mod_time = try(local.m108["mod_time"], null)
  model = try(local.m108["model"], null)
  moid = try(local.m108["moid"], null)
  object_type = try(local.m108["object_type"], null)
  owners = try(local.m108["owners"], null)
  presence = try(local.m108["presence"], null)
  results = try(local.m108["results"], null)
  revision = try(local.m108["revision"], null)
  rn = try(local.m108["rn"], null)
  secure_boot = try(local.m108["secure_boot"], null)
  serial = try(local.m108["serial"], null)
  shared_scope = try(local.m108["shared_scope"], null)
  vendor = try(local.m108["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m108["ancestors"], null) == null ? [] : local.m108["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "bios_unit" {
    for_each = try(local.m108["bios_unit"], null) == null ? [] : local.m108["bios_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_devices" {
    for_each = try(local.m108["boot_devices"], null) == null ? [] : local.m108["boot_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m108["parent"], null) == null ? [] : local.m108["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m108["permission_resources"], null) == null ? [] : local.m108["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m108["previous_fru"], null) == null ? [] : local.m108["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m108["registered_device"], null) == null ? [] : local.m108["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m108["tags"], null) == null ? [] : local.m108["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m108["version_context"], null) == null ? [] : local.m108["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
