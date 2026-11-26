# Sample data source intersight_hcl_operating_system — reads ../models/data_intersight_hcl_operating_system.yml
locals { m548 = yamldecode(file("${path.module}/../models/data_intersight_hcl_operating_system.yml"))["data_intersight_hcl_operating_system"] }

data "intersight_hcl_operating_system" "n548" {
  account_moid = try(local.m548["account_moid"], null)
  additional_properties = try(local.m548["additional_properties"], null)
  class_id = try(local.m548["class_id"], null)
  create_time = try(local.m548["create_time"], null)
  domain_group_moid = try(local.m548["domain_group_moid"], null)
  id = try(local.m548["id"], null)
  mod_time = try(local.m548["mod_time"], null)
  moid = try(local.m548["moid"], null)
  nr_version = try(local.m548["nr_version"], null)
  object_type = try(local.m548["object_type"], null)
  owners = try(local.m548["owners"], null)
  results = try(local.m548["results"], null)
  shared_scope = try(local.m548["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m548["ancestors"], null) == null ? [] : local.m548["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m548["parent"], null) == null ? [] : local.m548["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m548["permission_resources"], null) == null ? [] : local.m548["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m548["tags"], null) == null ? [] : local.m548["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vendor" {
    for_each = try(local.m548["vendor"], null) == null ? [] : local.m548["vendor"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m548["version_context"], null) == null ? [] : local.m548["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
