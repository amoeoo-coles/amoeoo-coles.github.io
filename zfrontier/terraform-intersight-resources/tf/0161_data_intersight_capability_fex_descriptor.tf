# Sample data source intersight_capability_fex_descriptor — reads ../models/data_intersight_capability_fex_descriptor.yml
locals { m161 = yamldecode(file("${path.module}/../models/data_intersight_capability_fex_descriptor.yml"))["data_intersight_capability_fex_descriptor"] }

data "intersight_capability_fex_descriptor" "n161" {
  account_moid = try(local.m161["account_moid"], null)
  additional_properties = try(local.m161["additional_properties"], null)
  class_id = try(local.m161["class_id"], null)
  create_time = try(local.m161["create_time"], null)
  description = try(local.m161["description"], null)
  domain_group_moid = try(local.m161["domain_group_moid"], null)
  id = try(local.m161["id"], null)
  mod_time = try(local.m161["mod_time"], null)
  model = try(local.m161["model"], null)
  moid = try(local.m161["moid"], null)
  nr_version = try(local.m161["nr_version"], null)
  object_type = try(local.m161["object_type"], null)
  owners = try(local.m161["owners"], null)
  results = try(local.m161["results"], null)
  revision = try(local.m161["revision"], null)
  shared_scope = try(local.m161["shared_scope"], null)
  vendor = try(local.m161["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m161["ancestors"], null) == null ? [] : local.m161["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m161["capabilities"], null) == null ? [] : local.m161["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m161["parent"], null) == null ? [] : local.m161["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m161["permission_resources"], null) == null ? [] : local.m161["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m161["tags"], null) == null ? [] : local.m161["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m161["version_context"], null) == null ? [] : local.m161["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
