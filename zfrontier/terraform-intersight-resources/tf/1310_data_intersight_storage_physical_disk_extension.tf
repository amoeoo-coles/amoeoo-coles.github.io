# Sample data source intersight_storage_physical_disk_extension — reads ../models/data_intersight_storage_physical_disk_extension.yml
locals { m1310 = yamldecode(file("${path.module}/../models/data_intersight_storage_physical_disk_extension.yml"))["data_intersight_storage_physical_disk_extension"] }

data "intersight_storage_physical_disk_extension" "n1310" {
  account_moid = try(local.m1310["account_moid"], null)
  additional_properties = try(local.m1310["additional_properties"], null)
  bootable = try(local.m1310["bootable"], null)
  class_id = try(local.m1310["class_id"], null)
  create_time = try(local.m1310["create_time"], null)
  device_mo_id = try(local.m1310["device_mo_id"], null)
  disk_dn = try(local.m1310["disk_dn"], null)
  disk_id = try(local.m1310["disk_id"], null)
  disk_state = try(local.m1310["disk_state"], null)
  dn = try(local.m1310["dn"], null)
  domain_group_moid = try(local.m1310["domain_group_moid"], null)
  health = try(local.m1310["health"], null)
  id = try(local.m1310["id"], null)
  is_upgraded = try(local.m1310["is_upgraded"], null)
  mod_time = try(local.m1310["mod_time"], null)
  model = try(local.m1310["model"], null)
  moid = try(local.m1310["moid"], null)
  object_type = try(local.m1310["object_type"], null)
  owners = try(local.m1310["owners"], null)
  presence = try(local.m1310["presence"], null)
  results = try(local.m1310["results"], null)
  revision = try(local.m1310["revision"], null)
  rn = try(local.m1310["rn"], null)
  serial = try(local.m1310["serial"], null)
  shared_scope = try(local.m1310["shared_scope"], null)
  vendor = try(local.m1310["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1310["ancestors"], null) == null ? [] : local.m1310["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1310["inventory_device_info"], null) == null ? [] : local.m1310["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1310["parent"], null) == null ? [] : local.m1310["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1310["permission_resources"], null) == null ? [] : local.m1310["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_disk" {
    for_each = try(local.m1310["physical_disk"], null) == null ? [] : local.m1310["physical_disk"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1310["previous_fru"], null) == null ? [] : local.m1310["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1310["registered_device"], null) == null ? [] : local.m1310["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_controller" {
    for_each = try(local.m1310["storage_controller"], null) == null ? [] : local.m1310["storage_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1310["tags"], null) == null ? [] : local.m1310["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1310["version_context"], null) == null ? [] : local.m1310["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
