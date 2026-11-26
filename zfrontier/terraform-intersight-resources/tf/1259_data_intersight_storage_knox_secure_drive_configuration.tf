# Sample data source intersight_storage_knox_secure_drive_configuration — reads ../models/data_intersight_storage_knox_secure_drive_configuration.yml
locals { m1259 = yamldecode(file("${path.module}/../models/data_intersight_storage_knox_secure_drive_configuration.yml"))["data_intersight_storage_knox_secure_drive_configuration"] }

data "intersight_storage_knox_secure_drive_configuration" "n1259" {
  account_moid = try(local.m1259["account_moid"], null)
  additional_properties = try(local.m1259["additional_properties"], null)
  class_id = try(local.m1259["class_id"], null)
  controller_dn = try(local.m1259["controller_dn"], null)
  controller_moid = try(local.m1259["controller_moid"], null)
  create_time = try(local.m1259["create_time"], null)
  domain_group_moid = try(local.m1259["domain_group_moid"], null)
  id = try(local.m1259["id"], null)
  mod_time = try(local.m1259["mod_time"], null)
  moid = try(local.m1259["moid"], null)
  object_type = try(local.m1259["object_type"], null)
  owners = try(local.m1259["owners"], null)
  results = try(local.m1259["results"], null)
  shared_scope = try(local.m1259["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1259["ancestors"], null) == null ? [] : local.m1259["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disk_states" {
    for_each = try(local.m1259["disk_states"], null) == null ? [] : local.m1259["disk_states"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "drive_groups" {
    for_each = try(local.m1259["drive_groups"], null) == null ? [] : local.m1259["drive_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1259["parent"], null) == null ? [] : local.m1259["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1259["permission_resources"], null) == null ? [] : local.m1259["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_profile" {
    for_each = try(local.m1259["server_profile"], null) == null ? [] : local.m1259["server_profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_policy" {
    for_each = try(local.m1259["storage_policy"], null) == null ? [] : local.m1259["storage_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1259["tags"], null) == null ? [] : local.m1259["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1259["version_context"], null) == null ? [] : local.m1259["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
