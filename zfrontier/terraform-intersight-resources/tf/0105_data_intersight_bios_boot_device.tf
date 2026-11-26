# Sample data source intersight_bios_boot_device — reads ../models/data_intersight_bios_boot_device.yml
locals { m105 = yamldecode(file("${path.module}/../models/data_intersight_bios_boot_device.yml"))["data_intersight_bios_boot_device"] }

data "intersight_bios_boot_device" "n105" {
  account_moid = try(local.m105["account_moid"], null)
  additional_properties = try(local.m105["additional_properties"], null)
  class_id = try(local.m105["class_id"], null)
  create_time = try(local.m105["create_time"], null)
  device_mo_id = try(local.m105["device_mo_id"], null)
  device_name = try(local.m105["device_name"], null)
  device_type = try(local.m105["device_type"], null)
  dn = try(local.m105["dn"], null)
  domain_group_moid = try(local.m105["domain_group_moid"], null)
  id = try(local.m105["id"], null)
  is_upgraded = try(local.m105["is_upgraded"], null)
  mod_time = try(local.m105["mod_time"], null)
  model = try(local.m105["model"], null)
  moid = try(local.m105["moid"], null)
  object_type = try(local.m105["object_type"], null)
  owners = try(local.m105["owners"], null)
  presence = try(local.m105["presence"], null)
  results = try(local.m105["results"], null)
  revision = try(local.m105["revision"], null)
  rn = try(local.m105["rn"], null)
  serial = try(local.m105["serial"], null)
  shared_scope = try(local.m105["shared_scope"], null)
  vendor = try(local.m105["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m105["ancestors"], null) == null ? [] : local.m105["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "bios_system_boot_order" {
    for_each = try(local.m105["bios_system_boot_order"], null) == null ? [] : local.m105["bios_system_boot_order"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m105["parent"], null) == null ? [] : local.m105["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m105["permission_resources"], null) == null ? [] : local.m105["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m105["previous_fru"], null) == null ? [] : local.m105["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m105["registered_device"], null) == null ? [] : local.m105["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m105["tags"], null) == null ? [] : local.m105["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m105["version_context"], null) == null ? [] : local.m105["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
