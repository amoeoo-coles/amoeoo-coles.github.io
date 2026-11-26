# Sample data source intersight_capability_network_equipment_power_def — reads ../models/data_intersight_capability_network_equipment_power_def.yml
locals { m170 = yamldecode(file("${path.module}/../models/data_intersight_capability_network_equipment_power_def.yml"))["data_intersight_capability_network_equipment_power_def"] }

data "intersight_capability_network_equipment_power_def" "n170" {
  account_moid = try(local.m170["account_moid"], null)
  additional_properties = try(local.m170["additional_properties"], null)
  class_id = try(local.m170["class_id"], null)
  create_time = try(local.m170["create_time"], null)
  device_type = try(local.m170["device_type"], null)
  domain_group_moid = try(local.m170["domain_group_moid"], null)
  id = try(local.m170["id"], null)
  max_power = try(local.m170["max_power"], null)
  mod_time = try(local.m170["mod_time"], null)
  moid = try(local.m170["moid"], null)
  name = try(local.m170["name"], null)
  object_type = try(local.m170["object_type"], null)
  owners = try(local.m170["owners"], null)
  pid = try(local.m170["pid"], null)
  results = try(local.m170["results"], null)
  shared_scope = try(local.m170["shared_scope"], null)
  typical_power = try(local.m170["typical_power"], null)
  dynamic "ancestors" {
    for_each = try(local.m170["ancestors"], null) == null ? [] : local.m170["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m170["parent"], null) == null ? [] : local.m170["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m170["permission_resources"], null) == null ? [] : local.m170["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m170["tags"], null) == null ? [] : local.m170["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m170["version_context"], null) == null ? [] : local.m170["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
