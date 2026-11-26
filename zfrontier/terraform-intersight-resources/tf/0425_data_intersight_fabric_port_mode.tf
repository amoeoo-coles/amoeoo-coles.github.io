# Sample data source intersight_fabric_port_mode — reads ../models/data_intersight_fabric_port_mode.yml
locals { m425 = yamldecode(file("${path.module}/../models/data_intersight_fabric_port_mode.yml"))["data_intersight_fabric_port_mode"] }

data "intersight_fabric_port_mode" "n425" {
  account_moid = try(local.m425["account_moid"], null)
  additional_properties = try(local.m425["additional_properties"], null)
  class_id = try(local.m425["class_id"], null)
  create_time = try(local.m425["create_time"], null)
  custom_mode = try(local.m425["custom_mode"], null)
  domain_group_moid = try(local.m425["domain_group_moid"], null)
  id = try(local.m425["id"], null)
  mod_time = try(local.m425["mod_time"], null)
  moid = try(local.m425["moid"], null)
  object_type = try(local.m425["object_type"], null)
  owners = try(local.m425["owners"], null)
  port_id_end = try(local.m425["port_id_end"], null)
  port_id_start = try(local.m425["port_id_start"], null)
  results = try(local.m425["results"], null)
  shared_scope = try(local.m425["shared_scope"], null)
  slot_id = try(local.m425["slot_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m425["ancestors"], null) == null ? [] : local.m425["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m425["parent"], null) == null ? [] : local.m425["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m425["permission_resources"], null) == null ? [] : local.m425["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy" {
    for_each = try(local.m425["port_policy"], null) == null ? [] : local.m425["port_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m425["tags"], null) == null ? [] : local.m425["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m425["version_context"], null) == null ? [] : local.m425["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
