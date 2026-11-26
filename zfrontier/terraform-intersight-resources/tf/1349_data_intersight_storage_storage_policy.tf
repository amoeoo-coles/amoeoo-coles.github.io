# Sample data source intersight_storage_storage_policy — reads ../models/data_intersight_storage_storage_policy.yml
locals { m1349 = yamldecode(file("${path.module}/../models/data_intersight_storage_storage_policy.yml"))["data_intersight_storage_storage_policy"] }

data "intersight_storage_storage_policy" "n1349" {
  account_moid = try(local.m1349["account_moid"], null)
  additional_properties = try(local.m1349["additional_properties"], null)
  class_id = try(local.m1349["class_id"], null)
  controller_attached_nvme_slots = try(local.m1349["controller_attached_nvme_slots"], null)
  create_time = try(local.m1349["create_time"], null)
  default_drive_mode = try(local.m1349["default_drive_mode"], null)
  description = try(local.m1349["description"], null)
  direct_attached_nvme_slots = try(local.m1349["direct_attached_nvme_slots"], null)
  domain_group_moid = try(local.m1349["domain_group_moid"], null)
  global_hot_spares = try(local.m1349["global_hot_spares"], null)
  id = try(local.m1349["id"], null)
  mod_time = try(local.m1349["mod_time"], null)
  moid = try(local.m1349["moid"], null)
  name = try(local.m1349["name"], null)
  object_type = try(local.m1349["object_type"], null)
  owners = try(local.m1349["owners"], null)
  raid_attached_nvme_slots = try(local.m1349["raid_attached_nvme_slots"], null)
  results = try(local.m1349["results"], null)
  secure_jbods = try(local.m1349["secure_jbods"], null)
  shared_scope = try(local.m1349["shared_scope"], null)
  unused_disks_state = try(local.m1349["unused_disks_state"], null)
  use_jbod_for_vd_creation = try(local.m1349["use_jbod_for_vd_creation"], null)
  dynamic "ancestors" {
    for_each = try(local.m1349["ancestors"], null) == null ? [] : local.m1349["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "drive_group" {
    for_each = try(local.m1349["drive_group"], null) == null ? [] : local.m1349["drive_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "m2_virtual_drive" {
    for_each = try(local.m1349["m2_virtual_drive"], null) == null ? [] : local.m1349["m2_virtual_drive"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1349["organization"], null) == null ? [] : local.m1349["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1349["parent"], null) == null ? [] : local.m1349["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1349["permission_resources"], null) == null ? [] : local.m1349["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m1349["profiles"], null) == null ? [] : local.m1349["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "raid0_drive" {
    for_each = try(local.m1349["raid0_drive"], null) == null ? [] : local.m1349["raid0_drive"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1349["tags"], null) == null ? [] : local.m1349["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1349["version_context"], null) == null ? [] : local.m1349["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
