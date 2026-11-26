# Sample data source intersight_iam_ip_address — reads ../models/data_intersight_iam_ip_address.yml
locals { m710 = yamldecode(file("${path.module}/../models/data_intersight_iam_ip_address.yml"))["data_intersight_iam_ip_address"] }

data "intersight_iam_ip_address" "n710" {
  account_moid = try(local.m710["account_moid"], null)
  additional_properties = try(local.m710["additional_properties"], null)
  address = try(local.m710["address"], null)
  class_id = try(local.m710["class_id"], null)
  create_time = try(local.m710["create_time"], null)
  description = try(local.m710["description"], null)
  domain_group_moid = try(local.m710["domain_group_moid"], null)
  id = try(local.m710["id"], null)
  mod_time = try(local.m710["mod_time"], null)
  moid = try(local.m710["moid"], null)
  object_type = try(local.m710["object_type"], null)
  owners = try(local.m710["owners"], null)
  results = try(local.m710["results"], null)
  shared_scope = try(local.m710["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m710["ancestors"], null) == null ? [] : local.m710["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_access_management" {
    for_each = try(local.m710["ip_access_management"], null) == null ? [] : local.m710["ip_access_management"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m710["parent"], null) == null ? [] : local.m710["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m710["permission_resources"], null) == null ? [] : local.m710["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m710["tags"], null) == null ? [] : local.m710["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m710["version_context"], null) == null ? [] : local.m710["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
