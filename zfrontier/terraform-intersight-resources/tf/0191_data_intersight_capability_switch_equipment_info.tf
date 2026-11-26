# Sample data source intersight_capability_switch_equipment_info — reads ../models/data_intersight_capability_switch_equipment_info.yml
locals { m191 = yamldecode(file("${path.module}/../models/data_intersight_capability_switch_equipment_info.yml"))["data_intersight_capability_switch_equipment_info"] }

data "intersight_capability_switch_equipment_info" "n191" {
  account_moid = try(local.m191["account_moid"], null)
  additional_properties = try(local.m191["additional_properties"], null)
  class_id = try(local.m191["class_id"], null)
  create_time = try(local.m191["create_time"], null)
  domain_group_moid = try(local.m191["domain_group_moid"], null)
  id = try(local.m191["id"], null)
  max_fan_modules = try(local.m191["max_fan_modules"], null)
  max_fans_in_fan_module = try(local.m191["max_fans_in_fan_module"], null)
  mod_time = try(local.m191["mod_time"], null)
  moid = try(local.m191["moid"], null)
  name = try(local.m191["name"], null)
  object_type = try(local.m191["object_type"], null)
  owners = try(local.m191["owners"], null)
  pid = try(local.m191["pid"], null)
  results = try(local.m191["results"], null)
  shared_scope = try(local.m191["shared_scope"], null)
  sku = try(local.m191["sku"], null)
  vid = try(local.m191["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m191["ancestors"], null) == null ? [] : local.m191["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m191["parent"], null) == null ? [] : local.m191["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m191["permission_resources"], null) == null ? [] : local.m191["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m191["tags"], null) == null ? [] : local.m191["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m191["version_context"], null) == null ? [] : local.m191["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
