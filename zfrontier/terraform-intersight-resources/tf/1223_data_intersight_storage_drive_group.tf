# Sample data source intersight_storage_drive_group — reads ../models/data_intersight_storage_drive_group.yml
locals { m1223 = yamldecode(file("${path.module}/../models/data_intersight_storage_drive_group.yml"))["data_intersight_storage_drive_group"] }

data "intersight_storage_drive_group" "n1223" {
  account_moid = try(local.m1223["account_moid"], null)
  additional_properties = try(local.m1223["additional_properties"], null)
  class_id = try(local.m1223["class_id"], null)
  create_time = try(local.m1223["create_time"], null)
  domain_group_moid = try(local.m1223["domain_group_moid"], null)
  id = try(local.m1223["id"], null)
  mod_time = try(local.m1223["mod_time"], null)
  moid = try(local.m1223["moid"], null)
  name = try(local.m1223["name"], null)
  object_type = try(local.m1223["object_type"], null)
  owners = try(local.m1223["owners"], null)
  raid_level = try(local.m1223["raid_level"], null)
  results = try(local.m1223["results"], null)
  secure_drive_group = try(local.m1223["secure_drive_group"], null)
  shared_scope = try(local.m1223["shared_scope"], null)
  type = try(local.m1223["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m1223["ancestors"], null) == null ? [] : local.m1223["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "automatic_drive_group" {
    for_each = try(local.m1223["automatic_drive_group"], null) == null ? [] : local.m1223["automatic_drive_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "manual_drive_group" {
    for_each = try(local.m1223["manual_drive_group"], null) == null ? [] : local.m1223["manual_drive_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1223["parent"], null) == null ? [] : local.m1223["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1223["permission_resources"], null) == null ? [] : local.m1223["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_policy" {
    for_each = try(local.m1223["storage_policy"], null) == null ? [] : local.m1223["storage_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1223["tags"], null) == null ? [] : local.m1223["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1223["version_context"], null) == null ? [] : local.m1223["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_drives" {
    for_each = try(local.m1223["virtual_drives"], null) == null ? [] : local.m1223["virtual_drives"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
