# Sample data source intersight_compute_blade_identity — reads ../models/data_intersight_compute_blade_identity.yml
locals { m236 = yamldecode(file("${path.module}/../models/data_intersight_compute_blade_identity.yml"))["data_intersight_compute_blade_identity"] }

data "intersight_compute_blade_identity" "n236" {
  account_moid = try(local.m236["account_moid"], null)
  additional_properties = try(local.m236["additional_properties"], null)
  admin_action = try(local.m236["admin_action"], null)
  admin_action_state = try(local.m236["admin_action_state"], null)
  chassis_id = try(local.m236["chassis_id"], null)
  class_id = try(local.m236["class_id"], null)
  create_time = try(local.m236["create_time"], null)
  current_chassis_id = try(local.m236["current_chassis_id"], null)
  current_slot_id = try(local.m236["current_slot_id"], null)
  domain_group_moid = try(local.m236["domain_group_moid"], null)
  firmware_supportability = try(local.m236["firmware_supportability"], null)
  id = try(local.m236["id"], null)
  identifier = try(local.m236["identifier"], null)
  last_discovery_triggered = try(local.m236["last_discovery_triggered"], null)
  lifecycle_mod_time = try(local.m236["lifecycle_mod_time"], null)
  manager_slot_id = try(local.m236["manager_slot_id"], null)
  mod_time = try(local.m236["mod_time"], null)
  model = try(local.m236["model"], null)
  moid = try(local.m236["moid"], null)
  name = try(local.m236["name"], null)
  nr_lifecycle = try(local.m236["nr_lifecycle"], null)
  object_type = try(local.m236["object_type"], null)
  owners = try(local.m236["owners"], null)
  presence = try(local.m236["presence"], null)
  reset_to_default = try(local.m236["reset_to_default"], null)
  results = try(local.m236["results"], null)
  serial = try(local.m236["serial"], null)
  shared_scope = try(local.m236["shared_scope"], null)
  slot_id = try(local.m236["slot_id"], null)
  vendor = try(local.m236["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m236["ancestors"], null) == null ? [] : local.m236["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "custom_permission_resources" {
    for_each = try(local.m236["custom_permission_resources"], null) == null ? [] : local.m236["custom_permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "discovered_blade_id_in_curr_location" {
    for_each = try(local.m236["discovered_blade_id_in_curr_location"], null) == null ? [] : local.m236["discovered_blade_id_in_curr_location"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "managed_nodes" {
    for_each = try(local.m236["managed_nodes"], null) == null ? [] : local.m236["managed_nodes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "new_blade_id_in_discovered_location" {
    for_each = try(local.m236["new_blade_id_in_discovered_location"], null) == null ? [] : local.m236["new_blade_id_in_discovered_location"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m236["parent"], null) == null ? [] : local.m236["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m236["permission_resources"], null) == null ? [] : local.m236["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_device_registration" {
    for_each = try(local.m236["physical_device_registration"], null) == null ? [] : local.m236["physical_device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m236["registered_device"], null) == null ? [] : local.m236["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m236["tags"], null) == null ? [] : local.m236["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m236["version_context"], null) == null ? [] : local.m236["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
