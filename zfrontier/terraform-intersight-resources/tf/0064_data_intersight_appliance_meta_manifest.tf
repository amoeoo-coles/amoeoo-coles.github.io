# Sample data source intersight_appliance_meta_manifest — reads ../models/data_intersight_appliance_meta_manifest.yml
locals { m064 = yamldecode(file("${path.module}/../models/data_intersight_appliance_meta_manifest.yml"))["data_intersight_appliance_meta_manifest"] }

data "intersight_appliance_meta_manifest" "n064" {
  account_moid = try(local.m064["account_moid"], null)
  additional_properties = try(local.m064["additional_properties"], null)
  class_id = try(local.m064["class_id"], null)
  create_time = try(local.m064["create_time"], null)
  creation_date = try(local.m064["creation_date"], null)
  domain_group_moid = try(local.m064["domain_group_moid"], null)
  file_description = try(local.m064["file_description"], null)
  file_name = try(local.m064["file_name"], null)
  filechk_sum = try(local.m064["filechk_sum"], null)
  id = try(local.m064["id"], null)
  install_date = try(local.m064["install_date"], null)
  mod_time = try(local.m064["mod_time"], null)
  moid = try(local.m064["moid"], null)
  object_type = try(local.m064["object_type"], null)
  owners = try(local.m064["owners"], null)
  results = try(local.m064["results"], null)
  shared_scope = try(local.m064["shared_scope"], null)
  status = try(local.m064["status"], null)
  dynamic "account" {
    for_each = try(local.m064["account"], null) == null ? [] : local.m064["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m064["ancestors"], null) == null ? [] : local.m064["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m064["parent"], null) == null ? [] : local.m064["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m064["permission_resources"], null) == null ? [] : local.m064["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m064["tags"], null) == null ? [] : local.m064["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m064["version_context"], null) == null ? [] : local.m064["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
