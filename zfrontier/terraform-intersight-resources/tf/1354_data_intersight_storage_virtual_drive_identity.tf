# Sample data source intersight_storage_virtual_drive_identity — reads ../models/data_intersight_storage_virtual_drive_identity.yml
locals { m1354 = yamldecode(file("${path.module}/../models/data_intersight_storage_virtual_drive_identity.yml"))["data_intersight_storage_virtual_drive_identity"] }

data "intersight_storage_virtual_drive_identity" "n1354" {
  account_moid = try(local.m1354["account_moid"], null)
  additional_properties = try(local.m1354["additional_properties"], null)
  class_id = try(local.m1354["class_id"], null)
  create_time = try(local.m1354["create_time"], null)
  domain_group_moid = try(local.m1354["domain_group_moid"], null)
  id = try(local.m1354["id"], null)
  mod_time = try(local.m1354["mod_time"], null)
  moid = try(local.m1354["moid"], null)
  name = try(local.m1354["name"], null)
  object_type = try(local.m1354["object_type"], null)
  owners = try(local.m1354["owners"], null)
  results = try(local.m1354["results"], null)
  shared_scope = try(local.m1354["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1354["ancestors"], null) == null ? [] : local.m1354["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1354["parent"], null) == null ? [] : local.m1354["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1354["permission_resources"], null) == null ? [] : local.m1354["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_profile" {
    for_each = try(local.m1354["server_profile"], null) == null ? [] : local.m1354["server_profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_policy" {
    for_each = try(local.m1354["storage_policy"], null) == null ? [] : local.m1354["storage_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1354["tags"], null) == null ? [] : local.m1354["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1354["version_context"], null) == null ? [] : local.m1354["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_drive" {
    for_each = try(local.m1354["virtual_drive"], null) == null ? [] : local.m1354["virtual_drive"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
