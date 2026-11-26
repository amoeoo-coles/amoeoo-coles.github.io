# Sample data source intersight_equipment_rack_enclosure — reads ../models/data_intersight_equipment_rack_enclosure.yml
locals { m327 = yamldecode(file("${path.module}/../models/data_intersight_equipment_rack_enclosure.yml"))["data_intersight_equipment_rack_enclosure"] }

data "intersight_equipment_rack_enclosure" "n327" {
  account_moid = try(local.m327["account_moid"], null)
  additional_properties = try(local.m327["additional_properties"], null)
  class_id = try(local.m327["class_id"], null)
  create_time = try(local.m327["create_time"], null)
  device_mo_id = try(local.m327["device_mo_id"], null)
  dn = try(local.m327["dn"], null)
  domain_group_moid = try(local.m327["domain_group_moid"], null)
  enclosure_id = try(local.m327["enclosure_id"], null)
  id = try(local.m327["id"], null)
  is_upgraded = try(local.m327["is_upgraded"], null)
  mod_time = try(local.m327["mod_time"], null)
  model = try(local.m327["model"], null)
  moid = try(local.m327["moid"], null)
  object_type = try(local.m327["object_type"], null)
  owners = try(local.m327["owners"], null)
  presence = try(local.m327["presence"], null)
  results = try(local.m327["results"], null)
  revision = try(local.m327["revision"], null)
  rn = try(local.m327["rn"], null)
  serial = try(local.m327["serial"], null)
  shared_scope = try(local.m327["shared_scope"], null)
  vendor = try(local.m327["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m327["ancestors"], null) == null ? [] : local.m327["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fanmodules" {
    for_each = try(local.m327["fanmodules"], null) == null ? [] : local.m327["fanmodules"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m327["inventory_device_info"], null) == null ? [] : local.m327["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m327["parent"], null) == null ? [] : local.m327["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m327["permission_resources"], null) == null ? [] : local.m327["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m327["previous_fru"], null) == null ? [] : local.m327["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "psus" {
    for_each = try(local.m327["psus"], null) == null ? [] : local.m327["psus"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m327["registered_device"], null) == null ? [] : local.m327["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "slots" {
    for_each = try(local.m327["slots"], null) == null ? [] : local.m327["slots"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m327["tags"], null) == null ? [] : local.m327["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m327["version_context"], null) == null ? [] : local.m327["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
