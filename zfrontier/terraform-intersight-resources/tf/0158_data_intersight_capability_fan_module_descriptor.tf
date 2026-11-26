# Sample data source intersight_capability_fan_module_descriptor — reads ../models/data_intersight_capability_fan_module_descriptor.yml
locals { m158 = yamldecode(file("${path.module}/../models/data_intersight_capability_fan_module_descriptor.yml"))["data_intersight_capability_fan_module_descriptor"] }

data "intersight_capability_fan_module_descriptor" "n158" {
  account_moid = try(local.m158["account_moid"], null)
  additional_properties = try(local.m158["additional_properties"], null)
  class_id = try(local.m158["class_id"], null)
  create_time = try(local.m158["create_time"], null)
  description = try(local.m158["description"], null)
  domain_group_moid = try(local.m158["domain_group_moid"], null)
  id = try(local.m158["id"], null)
  mod_time = try(local.m158["mod_time"], null)
  model = try(local.m158["model"], null)
  moid = try(local.m158["moid"], null)
  nr_version = try(local.m158["nr_version"], null)
  object_type = try(local.m158["object_type"], null)
  owners = try(local.m158["owners"], null)
  results = try(local.m158["results"], null)
  revision = try(local.m158["revision"], null)
  shared_scope = try(local.m158["shared_scope"], null)
  vendor = try(local.m158["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m158["ancestors"], null) == null ? [] : local.m158["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m158["capabilities"], null) == null ? [] : local.m158["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m158["parent"], null) == null ? [] : local.m158["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m158["permission_resources"], null) == null ? [] : local.m158["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m158["tags"], null) == null ? [] : local.m158["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m158["version_context"], null) == null ? [] : local.m158["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
