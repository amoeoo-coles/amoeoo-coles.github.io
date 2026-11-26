# Sample data source intersight_capability_adapter_deprecated_def — reads ../models/data_intersight_capability_adapter_deprecated_def.yml
locals { m141 = yamldecode(file("${path.module}/../models/data_intersight_capability_adapter_deprecated_def.yml"))["data_intersight_capability_adapter_deprecated_def"] }

data "intersight_capability_adapter_deprecated_def" "n141" {
  account_moid = try(local.m141["account_moid"], null)
  additional_properties = try(local.m141["additional_properties"], null)
  class_id = try(local.m141["class_id"], null)
  create_time = try(local.m141["create_time"], null)
  domain_group_moid = try(local.m141["domain_group_moid"], null)
  id = try(local.m141["id"], null)
  mod_time = try(local.m141["mod_time"], null)
  model = try(local.m141["model"], null)
  moid = try(local.m141["moid"], null)
  name = try(local.m141["name"], null)
  object_type = try(local.m141["object_type"], null)
  owners = try(local.m141["owners"], null)
  results = try(local.m141["results"], null)
  shared_scope = try(local.m141["shared_scope"], null)
  vendor = try(local.m141["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m141["ancestors"], null) == null ? [] : local.m141["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m141["parent"], null) == null ? [] : local.m141["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m141["permission_resources"], null) == null ? [] : local.m141["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m141["tags"], null) == null ? [] : local.m141["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m141["version_context"], null) == null ? [] : local.m141["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
