# Sample data source intersight_license_iwo_license_count — reads ../models/data_intersight_license_iwo_license_count.yml
locals { m803 = yamldecode(file("${path.module}/../models/data_intersight_license_iwo_license_count.yml"))["data_intersight_license_iwo_license_count"] }

data "intersight_license_iwo_license_count" "n803" {
  account_moid = try(local.m803["account_moid"], null)
  additional_properties = try(local.m803["additional_properties"], null)
  class_id = try(local.m803["class_id"], null)
  create_time = try(local.m803["create_time"], null)
  domain_group_moid = try(local.m803["domain_group_moid"], null)
  id = try(local.m803["id"], null)
  mod_time = try(local.m803["mod_time"], null)
  moid = try(local.m803["moid"], null)
  object_type = try(local.m803["object_type"], null)
  owners = try(local.m803["owners"], null)
  results = try(local.m803["results"], null)
  shared_scope = try(local.m803["shared_scope"], null)
  vm_license_count = try(local.m803["vm_license_count"], null)
  dynamic "account_license_data" {
    for_each = try(local.m803["account_license_data"], null) == null ? [] : local.m803["account_license_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m803["ancestors"], null) == null ? [] : local.m803["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m803["parent"], null) == null ? [] : local.m803["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m803["permission_resources"], null) == null ? [] : local.m803["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m803["tags"], null) == null ? [] : local.m803["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m803["version_context"], null) == null ? [] : local.m803["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
