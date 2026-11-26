# Sample data source intersight_inventory_generic_inventory — reads ../models/data_intersight_inventory_generic_inventory.yml
locals { m750 = yamldecode(file("${path.module}/../models/data_intersight_inventory_generic_inventory.yml"))["data_intersight_inventory_generic_inventory"] }

data "intersight_inventory_generic_inventory" "n750" {
  account_moid = try(local.m750["account_moid"], null)
  additional_properties = try(local.m750["additional_properties"], null)
  class_id = try(local.m750["class_id"], null)
  create_time = try(local.m750["create_time"], null)
  device_mo_id = try(local.m750["device_mo_id"], null)
  dn = try(local.m750["dn"], null)
  domain_group_moid = try(local.m750["domain_group_moid"], null)
  id = try(local.m750["id"], null)
  key = try(var.secrets["data_intersight_inventory_generic_inventory.key"], local.m750["key"])
  mod_time = try(local.m750["mod_time"], null)
  moid = try(local.m750["moid"], null)
  object_type = try(local.m750["object_type"], null)
  owners = try(local.m750["owners"], null)
  results = try(local.m750["results"], null)
  rn = try(local.m750["rn"], null)
  shared_scope = try(local.m750["shared_scope"], null)
  type = try(local.m750["type"], null)
  value = try(local.m750["value"], null)
  dynamic "ancestors" {
    for_each = try(local.m750["ancestors"], null) == null ? [] : local.m750["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m750["inventory_device_info"], null) == null ? [] : local.m750["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_generic_inventory_holder" {
    for_each = try(local.m750["inventory_generic_inventory_holder"], null) == null ? [] : local.m750["inventory_generic_inventory_holder"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m750["parent"], null) == null ? [] : local.m750["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m750["permission_resources"], null) == null ? [] : local.m750["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m750["registered_device"], null) == null ? [] : local.m750["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m750["tags"], null) == null ? [] : local.m750["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m750["version_context"], null) == null ? [] : local.m750["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
