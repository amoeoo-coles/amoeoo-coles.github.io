# Sample data source intersight_rack_unit_personality — reads ../models/data_intersight_rack_unit_personality.yml
locals { m1084 = yamldecode(file("${path.module}/../models/data_intersight_rack_unit_personality.yml"))["data_intersight_rack_unit_personality"] }

data "intersight_rack_unit_personality" "n1084" {
  account_moid = try(local.m1084["account_moid"], null)
  additional_info = try(local.m1084["additional_info"], null)
  additional_properties = try(local.m1084["additional_properties"], null)
  class_id = try(local.m1084["class_id"], null)
  create_time = try(local.m1084["create_time"], null)
  device_mo_id = try(local.m1084["device_mo_id"], null)
  dn = try(local.m1084["dn"], null)
  domain_group_moid = try(local.m1084["domain_group_moid"], null)
  id = try(local.m1084["id"], null)
  mod_time = try(local.m1084["mod_time"], null)
  moid = try(local.m1084["moid"], null)
  name = try(local.m1084["name"], null)
  object_type = try(local.m1084["object_type"], null)
  owners = try(local.m1084["owners"], null)
  personality_id = try(local.m1084["personality_id"], null)
  results = try(local.m1084["results"], null)
  rn = try(local.m1084["rn"], null)
  shared_scope = try(local.m1084["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1084["ancestors"], null) == null ? [] : local.m1084["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m1084["compute_rack_unit"], null) == null ? [] : local.m1084["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1084["inventory_device_info"], null) == null ? [] : local.m1084["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1084["parent"], null) == null ? [] : local.m1084["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1084["permission_resources"], null) == null ? [] : local.m1084["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1084["registered_device"], null) == null ? [] : local.m1084["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1084["tags"], null) == null ? [] : local.m1084["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1084["version_context"], null) == null ? [] : local.m1084["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
