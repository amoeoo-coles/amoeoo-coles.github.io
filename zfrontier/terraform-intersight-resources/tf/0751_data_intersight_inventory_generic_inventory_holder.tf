# Sample data source intersight_inventory_generic_inventory_holder — reads ../models/data_intersight_inventory_generic_inventory_holder.yml
locals { m751 = yamldecode(file("${path.module}/../models/data_intersight_inventory_generic_inventory_holder.yml"))["data_intersight_inventory_generic_inventory_holder"] }

data "intersight_inventory_generic_inventory_holder" "n751" {
  account_moid = try(local.m751["account_moid"], null)
  additional_properties = try(local.m751["additional_properties"], null)
  class_id = try(local.m751["class_id"], null)
  create_time = try(local.m751["create_time"], null)
  device_mo_id = try(local.m751["device_mo_id"], null)
  dn = try(local.m751["dn"], null)
  domain_group_moid = try(local.m751["domain_group_moid"], null)
  endpoint = try(local.m751["endpoint"], null)
  id = try(local.m751["id"], null)
  mod_time = try(local.m751["mod_time"], null)
  moid = try(local.m751["moid"], null)
  object_type = try(local.m751["object_type"], null)
  owners = try(local.m751["owners"], null)
  results = try(local.m751["results"], null)
  rn = try(local.m751["rn"], null)
  shared_scope = try(local.m751["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m751["ancestors"], null) == null ? [] : local.m751["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m751["compute_blade"], null) == null ? [] : local.m751["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m751["compute_rack_unit"], null) == null ? [] : local.m751["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "generic_inventory" {
    for_each = try(local.m751["generic_inventory"], null) == null ? [] : local.m751["generic_inventory"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m751["inventory_device_info"], null) == null ? [] : local.m751["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m751["parent"], null) == null ? [] : local.m751["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m751["permission_resources"], null) == null ? [] : local.m751["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m751["registered_device"], null) == null ? [] : local.m751["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m751["tags"], null) == null ? [] : local.m751["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m751["version_context"], null) == null ? [] : local.m751["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
