# Sample data source intersight_license_erp_license_count — reads ../models/data_intersight_license_erp_license_count.yml
locals { m797 = yamldecode(file("${path.module}/../models/data_intersight_license_erp_license_count.yml"))["data_intersight_license_erp_license_count"] }

data "intersight_license_erp_license_count" "n797" {
  account_moid = try(local.m797["account_moid"], null)
  additional_properties = try(local.m797["additional_properties"], null)
  advantage_count = try(local.m797["advantage_count"], null)
  class_id = try(local.m797["class_id"], null)
  create_time = try(local.m797["create_time"], null)
  domain_group_moid = try(local.m797["domain_group_moid"], null)
  id = try(local.m797["id"], null)
  mod_time = try(local.m797["mod_time"], null)
  moid = try(local.m797["moid"], null)
  object_type = try(local.m797["object_type"], null)
  owners = try(local.m797["owners"], null)
  results = try(local.m797["results"], null)
  shared_scope = try(local.m797["shared_scope"], null)
  dynamic "account_license_data" {
    for_each = try(local.m797["account_license_data"], null) == null ? [] : local.m797["account_license_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m797["ancestors"], null) == null ? [] : local.m797["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m797["parent"], null) == null ? [] : local.m797["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m797["permission_resources"], null) == null ? [] : local.m797["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m797["tags"], null) == null ? [] : local.m797["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m797["version_context"], null) == null ? [] : local.m797["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
