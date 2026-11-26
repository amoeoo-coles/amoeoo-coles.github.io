# Sample data source intersight_appliance_image_bundle — reads ../models/data_intersight_appliance_image_bundle.yml
locals { m062 = yamldecode(file("${path.module}/../models/data_intersight_appliance_image_bundle.yml"))["data_intersight_appliance_image_bundle"] }

data "intersight_appliance_image_bundle" "n062" {
  account_moid = try(local.m062["account_moid"], null)
  additional_properties = try(local.m062["additional_properties"], null)
  auto_upgrade = try(local.m062["auto_upgrade"], null)
  class_id = try(local.m062["class_id"], null)
  create_time = try(local.m062["create_time"], null)
  description = try(local.m062["description"], null)
  domain_group_moid = try(local.m062["domain_group_moid"], null)
  fingerprint = try(local.m062["fingerprint"], null)
  has_error = try(local.m062["has_error"], null)
  id = try(local.m062["id"], null)
  mod_time = try(local.m062["mod_time"], null)
  moid = try(local.m062["moid"], null)
  name = try(local.m062["name"], null)
  notes = try(local.m062["notes"], null)
  nr_version = try(local.m062["nr_version"], null)
  object_type = try(local.m062["object_type"], null)
  owners = try(local.m062["owners"], null)
  priority = try(local.m062["priority"], null)
  release_time = try(local.m062["release_time"], null)
  results = try(local.m062["results"], null)
  shared_scope = try(local.m062["shared_scope"], null)
  status_message = try(local.m062["status_message"], null)
  upgrade_end_time = try(local.m062["upgrade_end_time"], null)
  upgrade_grace_period = try(local.m062["upgrade_grace_period"], null)
  upgrade_impact_duration = try(local.m062["upgrade_impact_duration"], null)
  upgrade_impact_enum = try(local.m062["upgrade_impact_enum"], null)
  upgrade_start_time = try(local.m062["upgrade_start_time"], null)
  dynamic "ancestors" {
    for_each = try(local.m062["ancestors"], null) == null ? [] : local.m062["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ansible_packages" {
    for_each = try(local.m062["ansible_packages"], null) == null ? [] : local.m062["ansible_packages"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "dc_packages" {
    for_each = try(local.m062["dc_packages"], null) == null ? [] : local.m062["dc_packages"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "debug_packages" {
    for_each = try(local.m062["debug_packages"], null) == null ? [] : local.m062["debug_packages"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "endpoint_packages" {
    for_each = try(local.m062["endpoint_packages"], null) == null ? [] : local.m062["endpoint_packages"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "infra_packages" {
    for_each = try(local.m062["infra_packages"], null) == null ? [] : local.m062["infra_packages"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "init_packages" {
    for_each = try(local.m062["init_packages"], null) == null ? [] : local.m062["init_packages"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m062["parent"], null) == null ? [] : local.m062["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m062["permission_resources"], null) == null ? [] : local.m062["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "requires" {
    for_each = try(local.m062["requires"], null) == null ? [] : local.m062["requires"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_packages" {
    for_each = try(local.m062["service_packages"], null) == null ? [] : local.m062["service_packages"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system_packages" {
    for_each = try(local.m062["system_packages"], null) == null ? [] : local.m062["system_packages"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m062["tags"], null) == null ? [] : local.m062["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ui_packages" {
    for_each = try(local.m062["ui_packages"], null) == null ? [] : local.m062["ui_packages"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m062["version_context"], null) == null ? [] : local.m062["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
