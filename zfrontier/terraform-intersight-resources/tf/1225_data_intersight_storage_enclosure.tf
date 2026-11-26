# Sample data source intersight_storage_enclosure — reads ../models/data_intersight_storage_enclosure.yml
locals { m1225 = yamldecode(file("${path.module}/../models/data_intersight_storage_enclosure.yml"))["data_intersight_storage_enclosure"] }

data "intersight_storage_enclosure" "n1225" {
  account_moid = try(local.m1225["account_moid"], null)
  additional_properties = try(local.m1225["additional_properties"], null)
  chassis_id = try(local.m1225["chassis_id"], null)
  class_id = try(local.m1225["class_id"], null)
  create_time = try(local.m1225["create_time"], null)
  description = try(local.m1225["description"], null)
  device_mo_id = try(local.m1225["device_mo_id"], null)
  dn = try(local.m1225["dn"], null)
  domain_group_moid = try(local.m1225["domain_group_moid"], null)
  enclosure_id = try(local.m1225["enclosure_id"], null)
  id = try(local.m1225["id"], null)
  is_upgraded = try(local.m1225["is_upgraded"], null)
  mod_time = try(local.m1225["mod_time"], null)
  model = try(local.m1225["model"], null)
  moid = try(local.m1225["moid"], null)
  num_slots = try(local.m1225["num_slots"], null)
  object_type = try(local.m1225["object_type"], null)
  owners = try(local.m1225["owners"], null)
  presence = try(local.m1225["presence"], null)
  results = try(local.m1225["results"], null)
  revision = try(local.m1225["revision"], null)
  rn = try(local.m1225["rn"], null)
  serial = try(local.m1225["serial"], null)
  server_id = try(local.m1225["server_id"], null)
  shared_scope = try(local.m1225["shared_scope"], null)
  type = try(local.m1225["type"], null)
  vendor = try(local.m1225["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1225["ancestors"], null) == null ? [] : local.m1225["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m1225["compute_blade"], null) == null ? [] : local.m1225["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m1225["compute_rack_unit"], null) == null ? [] : local.m1225["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "enclosure_disk_slots" {
    for_each = try(local.m1225["enclosure_disk_slots"], null) == null ? [] : local.m1225["enclosure_disk_slots"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "enclosure_disks" {
    for_each = try(local.m1225["enclosure_disks"], null) == null ? [] : local.m1225["enclosure_disks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m1225["equipment_chassis"], null) == null ? [] : local.m1225["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1225["inventory_device_info"], null) == null ? [] : local.m1225["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1225["parent"], null) == null ? [] : local.m1225["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1225["permission_resources"], null) == null ? [] : local.m1225["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_disks" {
    for_each = try(local.m1225["physical_disks"], null) == null ? [] : local.m1225["physical_disks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1225["previous_fru"], null) == null ? [] : local.m1225["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1225["registered_device"], null) == null ? [] : local.m1225["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1225["tags"], null) == null ? [] : local.m1225["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1225["version_context"], null) == null ? [] : local.m1225["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
