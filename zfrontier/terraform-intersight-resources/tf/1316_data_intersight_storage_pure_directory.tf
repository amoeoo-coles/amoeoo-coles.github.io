# Sample data source intersight_storage_pure_directory — reads ../models/data_intersight_storage_pure_directory.yml
locals { m1316 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_directory.yml"))["data_intersight_storage_pure_directory"] }

data "intersight_storage_pure_directory" "n1316" {
  account_moid = try(local.m1316["account_moid"], null)
  additional_properties = try(local.m1316["additional_properties"], null)
  class_id = try(local.m1316["class_id"], null)
  create_time = try(local.m1316["create_time"], null)
  created_time = try(local.m1316["created_time"], null)
  data_reduction = try(local.m1316["data_reduction"], null)
  destroyed = try(local.m1316["destroyed"], null)
  directory_name = try(local.m1316["directory_name"], null)
  domain_group_moid = try(local.m1316["domain_group_moid"], null)
  export_policy_list = try(local.m1316["export_policy_list"], null)
  file_system_name = try(local.m1316["file_system_name"], null)
  id = try(local.m1316["id"], null)
  member_name = try(local.m1316["member_name"], null)
  member_resource_type = try(local.m1316["member_resource_type"], null)
  mod_time = try(local.m1316["mod_time"], null)
  moid = try(local.m1316["moid"], null)
  name = try(local.m1316["name"], null)
  object_type = try(local.m1316["object_type"], null)
  owners = try(local.m1316["owners"], null)
  path = try(local.m1316["path"], null)
  policy_resource_type = try(local.m1316["policy_resource_type"], null)
  quota_policy_names = try(local.m1316["quota_policy_names"], null)
  results = try(local.m1316["results"], null)
  shared_scope = try(local.m1316["shared_scope"], null)
  snapshots = try(local.m1316["snapshots"], null)
  thin_provisioning = try(local.m1316["thin_provisioning"], null)
  total_physical = try(local.m1316["total_physical"], null)
  total_reduction = try(local.m1316["total_reduction"], null)
  total_used = try(local.m1316["total_used"], null)
  unique = try(local.m1316["unique"], null)
  dynamic "ancestors" {
    for_each = try(local.m1316["ancestors"], null) == null ? [] : local.m1316["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1316["array"], null) == null ? [] : local.m1316["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "export_policies" {
    for_each = try(local.m1316["export_policies"], null) == null ? [] : local.m1316["export_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "file_systems" {
    for_each = try(local.m1316["file_systems"], null) == null ? [] : local.m1316["file_systems"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1316["parent"], null) == null ? [] : local.m1316["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1316["permission_resources"], null) == null ? [] : local.m1316["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "quota_policies" {
    for_each = try(local.m1316["quota_policies"], null) == null ? [] : local.m1316["quota_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1316["registered_device"], null) == null ? [] : local.m1316["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1316["tags"], null) == null ? [] : local.m1316["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1316["version_context"], null) == null ? [] : local.m1316["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
