# Sample data source intersight_equipment_fex_identity — reads ../models/data_intersight_equipment_fex_identity.yml
locals { m315 = yamldecode(file("${path.module}/../models/data_intersight_equipment_fex_identity.yml"))["data_intersight_equipment_fex_identity"] }

data "intersight_equipment_fex_identity" "n315" {
  account_moid = try(local.m315["account_moid"], null)
  additional_properties = try(local.m315["additional_properties"], null)
  admin_action = try(local.m315["admin_action"], null)
  admin_action_state = try(local.m315["admin_action_state"], null)
  class_id = try(local.m315["class_id"], null)
  create_time = try(local.m315["create_time"], null)
  domain_group_moid = try(local.m315["domain_group_moid"], null)
  id = try(local.m315["id"], null)
  identifier = try(local.m315["identifier"], null)
  last_discovery_triggered = try(local.m315["last_discovery_triggered"], null)
  lifecycle_mod_time = try(local.m315["lifecycle_mod_time"], null)
  mod_time = try(local.m315["mod_time"], null)
  model = try(local.m315["model"], null)
  moid = try(local.m315["moid"], null)
  name = try(local.m315["name"], null)
  nr_lifecycle = try(local.m315["nr_lifecycle"], null)
  object_type = try(local.m315["object_type"], null)
  owners = try(local.m315["owners"], null)
  reset_to_default = try(local.m315["reset_to_default"], null)
  results = try(local.m315["results"], null)
  serial = try(local.m315["serial"], null)
  shared_scope = try(local.m315["shared_scope"], null)
  switch_id = try(local.m315["switch_id"], null)
  vendor = try(local.m315["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m315["ancestors"], null) == null ? [] : local.m315["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "custom_permission_resources" {
    for_each = try(local.m315["custom_permission_resources"], null) == null ? [] : local.m315["custom_permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fex" {
    for_each = try(local.m315["fex"], null) == null ? [] : local.m315["fex"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m315["network_element"], null) == null ? [] : local.m315["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m315["parent"], null) == null ? [] : local.m315["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m315["permission_resources"], null) == null ? [] : local.m315["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_device_registration" {
    for_each = try(local.m315["physical_device_registration"], null) == null ? [] : local.m315["physical_device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m315["registered_device"], null) == null ? [] : local.m315["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m315["tags"], null) == null ? [] : local.m315["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m315["version_context"], null) == null ? [] : local.m315["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
