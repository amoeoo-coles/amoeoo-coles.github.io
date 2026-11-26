# Sample data source intersight_equipment_chassis_identity — reads ../models/data_intersight_equipment_chassis_identity.yml
locals { m303 = yamldecode(file("${path.module}/../models/data_intersight_equipment_chassis_identity.yml"))["data_intersight_equipment_chassis_identity"] }

data "intersight_equipment_chassis_identity" "n303" {
  account_moid = try(local.m303["account_moid"], null)
  additional_properties = try(local.m303["additional_properties"], null)
  admin_action = try(local.m303["admin_action"], null)
  admin_action_state = try(local.m303["admin_action_state"], null)
  class_id = try(local.m303["class_id"], null)
  create_time = try(local.m303["create_time"], null)
  domain_group_moid = try(local.m303["domain_group_moid"], null)
  id = try(local.m303["id"], null)
  identifier = try(local.m303["identifier"], null)
  lifecycle_mod_time = try(local.m303["lifecycle_mod_time"], null)
  mod_time = try(local.m303["mod_time"], null)
  model = try(local.m303["model"], null)
  moid = try(local.m303["moid"], null)
  name = try(local.m303["name"], null)
  nr_lifecycle = try(local.m303["nr_lifecycle"], null)
  object_type = try(local.m303["object_type"], null)
  owners = try(local.m303["owners"], null)
  reset_to_default = try(local.m303["reset_to_default"], null)
  results = try(local.m303["results"], null)
  serial = try(local.m303["serial"], null)
  shared_scope = try(local.m303["shared_scope"], null)
  vendor = try(local.m303["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m303["ancestors"], null) == null ? [] : local.m303["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "chassis" {
    for_each = try(local.m303["chassis"], null) == null ? [] : local.m303["chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "custom_permission_resources" {
    for_each = try(local.m303["custom_permission_resources"], null) == null ? [] : local.m303["custom_permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "io_card_identity_list" {
    for_each = try(local.m303["io_card_identity_list"], null) == null ? [] : local.m303["io_card_identity_list"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m303["parent"], null) == null ? [] : local.m303["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m303["permission_resources"], null) == null ? [] : local.m303["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m303["registered_device"], null) == null ? [] : local.m303["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m303["tags"], null) == null ? [] : local.m303["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m303["version_context"], null) == null ? [] : local.m303["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
