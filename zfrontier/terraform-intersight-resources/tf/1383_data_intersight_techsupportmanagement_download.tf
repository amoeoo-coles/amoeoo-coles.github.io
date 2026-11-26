# Sample data source intersight_techsupportmanagement_download — reads ../models/data_intersight_techsupportmanagement_download.yml
locals { m1383 = yamldecode(file("${path.module}/../models/data_intersight_techsupportmanagement_download.yml"))["data_intersight_techsupportmanagement_download"] }

data "intersight_techsupportmanagement_download" "n1383" {
  account_moid = try(local.m1383["account_moid"], null)
  additional_properties = try(local.m1383["additional_properties"], null)
  class_id = try(local.m1383["class_id"], null)
  create_time = try(local.m1383["create_time"], null)
  domain_group_moid = try(local.m1383["domain_group_moid"], null)
  id = try(local.m1383["id"], null)
  mod_time = try(local.m1383["mod_time"], null)
  moid = try(local.m1383["moid"], null)
  object_type = try(local.m1383["object_type"], null)
  owners = try(local.m1383["owners"], null)
  results = try(local.m1383["results"], null)
  shared_scope = try(local.m1383["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1383["ancestors"], null) == null ? [] : local.m1383["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1383["parent"], null) == null ? [] : local.m1383["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1383["permission_resources"], null) == null ? [] : local.m1383["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1383["tags"], null) == null ? [] : local.m1383["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tech_support_status" {
    for_each = try(local.m1383["tech_support_status"], null) == null ? [] : local.m1383["tech_support_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1383["version_context"], null) == null ? [] : local.m1383["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
