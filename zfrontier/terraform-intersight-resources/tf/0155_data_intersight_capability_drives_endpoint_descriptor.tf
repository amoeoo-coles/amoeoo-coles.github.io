# Sample data source intersight_capability_drives_endpoint_descriptor — reads ../models/data_intersight_capability_drives_endpoint_descriptor.yml
locals { m155 = yamldecode(file("${path.module}/../models/data_intersight_capability_drives_endpoint_descriptor.yml"))["data_intersight_capability_drives_endpoint_descriptor"] }

data "intersight_capability_drives_endpoint_descriptor" "n155" {
  account_moid = try(local.m155["account_moid"], null)
  additional_properties = try(local.m155["additional_properties"], null)
  alias_model = try(local.m155["alias_model"], null)
  class_id = try(local.m155["class_id"], null)
  create_time = try(local.m155["create_time"], null)
  description = try(local.m155["description"], null)
  domain_group_moid = try(local.m155["domain_group_moid"], null)
  id = try(local.m155["id"], null)
  mod_time = try(local.m155["mod_time"], null)
  model = try(local.m155["model"], null)
  moid = try(local.m155["moid"], null)
  object_type = try(local.m155["object_type"], null)
  owners = try(local.m155["owners"], null)
  part_number = try(local.m155["part_number"], null)
  pid = try(local.m155["pid"], null)
  results = try(local.m155["results"], null)
  shared_scope = try(local.m155["shared_scope"], null)
  supported_platforms_pids = try(local.m155["supported_platforms_pids"], null)
  vendor = try(local.m155["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m155["ancestors"], null) == null ? [] : local.m155["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m155["parent"], null) == null ? [] : local.m155["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m155["permission_resources"], null) == null ? [] : local.m155["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m155["tags"], null) == null ? [] : local.m155["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m155["version_context"], null) == null ? [] : local.m155["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
