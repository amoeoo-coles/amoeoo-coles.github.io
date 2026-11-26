# Sample data source intersight_storage_pure_directory_policy — reads ../models/data_intersight_storage_pure_directory_policy.yml
locals { m1318 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_directory_policy.yml"))["data_intersight_storage_pure_directory_policy"] }

data "intersight_storage_pure_directory_policy" "n1318" {
  account_moid = try(local.m1318["account_moid"], null)
  additional_properties = try(local.m1318["additional_properties"], null)
  class_id = try(local.m1318["class_id"], null)
  create_time = try(local.m1318["create_time"], null)
  destroyed = try(local.m1318["destroyed"], null)
  domain_group_moid = try(local.m1318["domain_group_moid"], null)
  enabled = try(local.m1318["enabled"], null)
  id = try(local.m1318["id"], null)
  mod_time = try(local.m1318["mod_time"], null)
  moid = try(local.m1318["moid"], null)
  name = try(local.m1318["name"], null)
  object_type = try(local.m1318["object_type"], null)
  owners = try(local.m1318["owners"], null)
  policy_type = try(local.m1318["policy_type"], null)
  results = try(local.m1318["results"], null)
  shared_scope = try(local.m1318["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1318["ancestors"], null) == null ? [] : local.m1318["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1318["array"], null) == null ? [] : local.m1318["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "export_members" {
    for_each = try(local.m1318["export_members"], null) == null ? [] : local.m1318["export_members"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nfs_rules" {
    for_each = try(local.m1318["nfs_rules"], null) == null ? [] : local.m1318["nfs_rules"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1318["parent"], null) == null ? [] : local.m1318["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1318["permission_resources"], null) == null ? [] : local.m1318["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "quota_members" {
    for_each = try(local.m1318["quota_members"], null) == null ? [] : local.m1318["quota_members"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "quota_rules" {
    for_each = try(local.m1318["quota_rules"], null) == null ? [] : local.m1318["quota_rules"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1318["registered_device"], null) == null ? [] : local.m1318["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "smb_rules" {
    for_each = try(local.m1318["smb_rules"], null) == null ? [] : local.m1318["smb_rules"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1318["tags"], null) == null ? [] : local.m1318["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1318["version_context"], null) == null ? [] : local.m1318["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
