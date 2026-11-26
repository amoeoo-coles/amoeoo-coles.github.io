# Sample data source intersight_compute_rack_unit_identity — reads ../models/data_intersight_compute_rack_unit_identity.yml
locals { m246 = yamldecode(file("${path.module}/../models/data_intersight_compute_rack_unit_identity.yml"))["data_intersight_compute_rack_unit_identity"] }

data "intersight_compute_rack_unit_identity" "n246" {
  account_moid = try(local.m246["account_moid"], null)
  adapter_serial = try(local.m246["adapter_serial"], null)
  additional_properties = try(local.m246["additional_properties"], null)
  admin_action = try(local.m246["admin_action"], null)
  admin_action_state = try(local.m246["admin_action_state"], null)
  class_id = try(local.m246["class_id"], null)
  create_time = try(local.m246["create_time"], null)
  domain_group_moid = try(local.m246["domain_group_moid"], null)
  id = try(local.m246["id"], null)
  identifier = try(local.m246["identifier"], null)
  last_discovery_triggered = try(local.m246["last_discovery_triggered"], null)
  lifecycle_mod_time = try(local.m246["lifecycle_mod_time"], null)
  mod_time = try(local.m246["mod_time"], null)
  model = try(local.m246["model"], null)
  moid = try(local.m246["moid"], null)
  name = try(local.m246["name"], null)
  nr_lifecycle = try(local.m246["nr_lifecycle"], null)
  object_type = try(local.m246["object_type"], null)
  owners = try(local.m246["owners"], null)
  reset_to_default = try(local.m246["reset_to_default"], null)
  results = try(local.m246["results"], null)
  serial = try(local.m246["serial"], null)
  shared_scope = try(local.m246["shared_scope"], null)
  vendor = try(local.m246["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m246["ancestors"], null) == null ? [] : local.m246["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "custom_permission_resources" {
    for_each = try(local.m246["custom_permission_resources"], null) == null ? [] : local.m246["custom_permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m246["parent"], null) == null ? [] : local.m246["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m246["permission_resources"], null) == null ? [] : local.m246["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_device_registration" {
    for_each = try(local.m246["physical_device_registration"], null) == null ? [] : local.m246["physical_device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m246["registered_device"], null) == null ? [] : local.m246["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m246["tags"], null) == null ? [] : local.m246["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m246["version_context"], null) == null ? [] : local.m246["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
