# Sample data source intersight_capability_standard_redfish_support_meta — reads ../models/data_intersight_capability_standard_redfish_support_meta.yml
locals { m186 = yamldecode(file("${path.module}/../models/data_intersight_capability_standard_redfish_support_meta.yml"))["data_intersight_capability_standard_redfish_support_meta"] }

data "intersight_capability_standard_redfish_support_meta" "n186" {
  account_moid = try(local.m186["account_moid"], null)
  additional_properties = try(local.m186["additional_properties"], null)
  class_id = try(local.m186["class_id"], null)
  create_time = try(local.m186["create_time"], null)
  description = try(local.m186["description"], null)
  domain_group_moid = try(local.m186["domain_group_moid"], null)
  id = try(local.m186["id"], null)
  mod_time = try(local.m186["mod_time"], null)
  moid = try(local.m186["moid"], null)
  name = try(local.m186["name"], null)
  object_type = try(local.m186["object_type"], null)
  owners = try(local.m186["owners"], null)
  platform_type = try(local.m186["platform_type"], null)
  results = try(local.m186["results"], null)
  series_id = try(local.m186["series_id"], null)
  shared_scope = try(local.m186["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m186["ancestors"], null) == null ? [] : local.m186["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m186["parent"], null) == null ? [] : local.m186["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m186["permission_resources"], null) == null ? [] : local.m186["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m186["tags"], null) == null ? [] : local.m186["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m186["version_context"], null) == null ? [] : local.m186["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
