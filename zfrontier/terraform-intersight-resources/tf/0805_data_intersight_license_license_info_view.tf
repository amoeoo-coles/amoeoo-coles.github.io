# Sample data source intersight_license_license_info_view — reads ../models/data_intersight_license_license_info_view.yml
locals { m805 = yamldecode(file("${path.module}/../models/data_intersight_license_license_info_view.yml"))["data_intersight_license_license_info_view"] }

data "intersight_license_license_info_view" "n805" {
  account_moid = try(local.m805["account_moid"], null)
  additional_properties = try(local.m805["additional_properties"], null)
  class_id = try(local.m805["class_id"], null)
  create_time = try(local.m805["create_time"], null)
  domain_group_moid = try(local.m805["domain_group_moid"], null)
  id = try(local.m805["id"], null)
  mod_time = try(local.m805["mod_time"], null)
  moid = try(local.m805["moid"], null)
  object_type = try(local.m805["object_type"], null)
  owners = try(local.m805["owners"], null)
  results = try(local.m805["results"], null)
  shared_scope = try(local.m805["shared_scope"], null)
  dynamic "account_license_data" {
    for_each = try(local.m805["account_license_data"], null) == null ? [] : local.m805["account_license_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m805["ancestors"], null) == null ? [] : local.m805["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m805["parent"], null) == null ? [] : local.m805["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m805["permission_resources"], null) == null ? [] : local.m805["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m805["tags"], null) == null ? [] : local.m805["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m805["version_context"], null) == null ? [] : local.m805["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
