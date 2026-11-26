# Sample data source intersight_storage_drive_security_policy — reads ../models/data_intersight_storage_drive_security_policy.yml
locals { m1224 = yamldecode(file("${path.module}/../models/data_intersight_storage_drive_security_policy.yml"))["data_intersight_storage_drive_security_policy"] }

data "intersight_storage_drive_security_policy" "n1224" {
  account_moid = try(local.m1224["account_moid"], null)
  additional_properties = try(local.m1224["additional_properties"], null)
  class_id = try(local.m1224["class_id"], null)
  create_time = try(local.m1224["create_time"], null)
  description = try(local.m1224["description"], null)
  domain_group_moid = try(local.m1224["domain_group_moid"], null)
  id = try(local.m1224["id"], null)
  mod_time = try(local.m1224["mod_time"], null)
  moid = try(local.m1224["moid"], null)
  name = try(local.m1224["name"], null)
  object_type = try(local.m1224["object_type"], null)
  owners = try(local.m1224["owners"], null)
  results = try(local.m1224["results"], null)
  shared_scope = try(local.m1224["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1224["ancestors"], null) == null ? [] : local.m1224["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "key_setting" {
    for_each = try(local.m1224["key_setting"], null) == null ? [] : local.m1224["key_setting"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1224["organization"], null) == null ? [] : local.m1224["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1224["parent"], null) == null ? [] : local.m1224["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1224["permission_resources"], null) == null ? [] : local.m1224["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m1224["profiles"], null) == null ? [] : local.m1224["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1224["tags"], null) == null ? [] : local.m1224["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1224["version_context"], null) == null ? [] : local.m1224["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
