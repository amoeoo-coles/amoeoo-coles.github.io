# Sample data source intersight_equipment_expander_module_identity — reads ../models/data_intersight_equipment_expander_module_identity.yml
locals { m309 = yamldecode(file("${path.module}/../models/data_intersight_equipment_expander_module_identity.yml"))["data_intersight_equipment_expander_module_identity"] }

data "intersight_equipment_expander_module_identity" "n309" {
  account_moid = try(local.m309["account_moid"], null)
  additional_properties = try(local.m309["additional_properties"], null)
  admin_action = try(local.m309["admin_action"], null)
  admin_action_state = try(local.m309["admin_action_state"], null)
  chassis_id = try(local.m309["chassis_id"], null)
  class_id = try(local.m309["class_id"], null)
  create_time = try(local.m309["create_time"], null)
  domain_group_moid = try(local.m309["domain_group_moid"], null)
  id = try(local.m309["id"], null)
  identifier = try(local.m309["identifier"], null)
  last_discovery_triggered = try(local.m309["last_discovery_triggered"], null)
  lifecycle_mod_time = try(local.m309["lifecycle_mod_time"], null)
  mod_time = try(local.m309["mod_time"], null)
  model = try(local.m309["model"], null)
  moid = try(local.m309["moid"], null)
  name = try(local.m309["name"], null)
  nr_lifecycle = try(local.m309["nr_lifecycle"], null)
  object_type = try(local.m309["object_type"], null)
  owners = try(local.m309["owners"], null)
  presence = try(local.m309["presence"], null)
  reset_to_default = try(local.m309["reset_to_default"], null)
  results = try(local.m309["results"], null)
  serial = try(local.m309["serial"], null)
  shared_scope = try(local.m309["shared_scope"], null)
  slot_id = try(local.m309["slot_id"], null)
  vendor = try(local.m309["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m309["ancestors"], null) == null ? [] : local.m309["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "custom_permission_resources" {
    for_each = try(local.m309["custom_permission_resources"], null) == null ? [] : local.m309["custom_permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "expander_module" {
    for_each = try(local.m309["expander_module"], null) == null ? [] : local.m309["expander_module"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m309["parent"], null) == null ? [] : local.m309["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m309["permission_resources"], null) == null ? [] : local.m309["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_device_registration" {
    for_each = try(local.m309["physical_device_registration"], null) == null ? [] : local.m309["physical_device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m309["registered_device"], null) == null ? [] : local.m309["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m309["tags"], null) == null ? [] : local.m309["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m309["version_context"], null) == null ? [] : local.m309["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
