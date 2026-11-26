# Sample data source intersight_equipment_chassis_id_pool — reads ../models/data_intersight_equipment_chassis_id_pool.yml
locals { m302 = yamldecode(file("${path.module}/../models/data_intersight_equipment_chassis_id_pool.yml"))["data_intersight_equipment_chassis_id_pool"] }

data "intersight_equipment_chassis_id_pool" "n302" {
  account_moid = try(local.m302["account_moid"], null)
  additional_properties = try(local.m302["additional_properties"], null)
  class_id = try(local.m302["class_id"], null)
  create_time = try(local.m302["create_time"], null)
  domain_group_moid = try(local.m302["domain_group_moid"], null)
  gap_available_ids = try(local.m302["gap_available_ids"], null)
  id = try(local.m302["id"], null)
  mod_time = try(local.m302["mod_time"], null)
  moid = try(local.m302["moid"], null)
  next_available_id = try(local.m302["next_available_id"], null)
  object_type = try(local.m302["object_type"], null)
  owners = try(local.m302["owners"], null)
  preferred_ids = try(local.m302["preferred_ids"], null)
  results = try(local.m302["results"], null)
  shared_scope = try(local.m302["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m302["ancestors"], null) == null ? [] : local.m302["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_registration" {
    for_each = try(local.m302["device_registration"], null) == null ? [] : local.m302["device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m302["parent"], null) == null ? [] : local.m302["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m302["permission_resources"], null) == null ? [] : local.m302["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m302["tags"], null) == null ? [] : local.m302["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m302["version_context"], null) == null ? [] : local.m302["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
