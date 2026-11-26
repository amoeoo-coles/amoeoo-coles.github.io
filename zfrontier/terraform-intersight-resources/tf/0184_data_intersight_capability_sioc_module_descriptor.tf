# Sample data source intersight_capability_sioc_module_descriptor — reads ../models/data_intersight_capability_sioc_module_descriptor.yml
locals { m184 = yamldecode(file("${path.module}/../models/data_intersight_capability_sioc_module_descriptor.yml"))["data_intersight_capability_sioc_module_descriptor"] }

data "intersight_capability_sioc_module_descriptor" "n184" {
  account_moid = try(local.m184["account_moid"], null)
  additional_properties = try(local.m184["additional_properties"], null)
  class_id = try(local.m184["class_id"], null)
  create_time = try(local.m184["create_time"], null)
  description = try(local.m184["description"], null)
  domain_group_moid = try(local.m184["domain_group_moid"], null)
  id = try(local.m184["id"], null)
  mod_time = try(local.m184["mod_time"], null)
  model = try(local.m184["model"], null)
  moid = try(local.m184["moid"], null)
  nr_version = try(local.m184["nr_version"], null)
  object_type = try(local.m184["object_type"], null)
  owners = try(local.m184["owners"], null)
  results = try(local.m184["results"], null)
  revision = try(local.m184["revision"], null)
  shared_scope = try(local.m184["shared_scope"], null)
  vendor = try(local.m184["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m184["ancestors"], null) == null ? [] : local.m184["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m184["capabilities"], null) == null ? [] : local.m184["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m184["parent"], null) == null ? [] : local.m184["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m184["permission_resources"], null) == null ? [] : local.m184["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m184["tags"], null) == null ? [] : local.m184["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m184["version_context"], null) == null ? [] : local.m184["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
