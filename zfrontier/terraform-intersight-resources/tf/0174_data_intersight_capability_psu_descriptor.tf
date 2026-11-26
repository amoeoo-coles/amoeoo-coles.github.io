# Sample data source intersight_capability_psu_descriptor — reads ../models/data_intersight_capability_psu_descriptor.yml
locals { m174 = yamldecode(file("${path.module}/../models/data_intersight_capability_psu_descriptor.yml"))["data_intersight_capability_psu_descriptor"] }

data "intersight_capability_psu_descriptor" "n174" {
  account_moid = try(local.m174["account_moid"], null)
  additional_properties = try(local.m174["additional_properties"], null)
  class_id = try(local.m174["class_id"], null)
  create_time = try(local.m174["create_time"], null)
  description = try(local.m174["description"], null)
  domain_group_moid = try(local.m174["domain_group_moid"], null)
  id = try(local.m174["id"], null)
  mod_time = try(local.m174["mod_time"], null)
  model = try(local.m174["model"], null)
  moid = try(local.m174["moid"], null)
  nr_version = try(local.m174["nr_version"], null)
  object_type = try(local.m174["object_type"], null)
  owners = try(local.m174["owners"], null)
  results = try(local.m174["results"], null)
  revision = try(local.m174["revision"], null)
  shared_scope = try(local.m174["shared_scope"], null)
  vendor = try(local.m174["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m174["ancestors"], null) == null ? [] : local.m174["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m174["capabilities"], null) == null ? [] : local.m174["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m174["parent"], null) == null ? [] : local.m174["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m174["permission_resources"], null) == null ? [] : local.m174["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m174["tags"], null) == null ? [] : local.m174["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m174["version_context"], null) == null ? [] : local.m174["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
