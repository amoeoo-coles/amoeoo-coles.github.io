# Sample data source intersight_capability_dimms_endpoint_descriptor — reads ../models/data_intersight_capability_dimms_endpoint_descriptor.yml
locals { m153 = yamldecode(file("${path.module}/../models/data_intersight_capability_dimms_endpoint_descriptor.yml"))["data_intersight_capability_dimms_endpoint_descriptor"] }

data "intersight_capability_dimms_endpoint_descriptor" "n153" {
  account_moid = try(local.m153["account_moid"], null)
  additional_properties = try(local.m153["additional_properties"], null)
  class_id = try(local.m153["class_id"], null)
  create_time = try(local.m153["create_time"], null)
  description = try(local.m153["description"], null)
  domain_group_moid = try(local.m153["domain_group_moid"], null)
  id = try(local.m153["id"], null)
  mod_time = try(local.m153["mod_time"], null)
  model = try(local.m153["model"], null)
  moid = try(local.m153["moid"], null)
  object_type = try(local.m153["object_type"], null)
  owners = try(local.m153["owners"], null)
  part_number = try(local.m153["part_number"], null)
  pid = try(local.m153["pid"], null)
  results = try(local.m153["results"], null)
  shared_scope = try(local.m153["shared_scope"], null)
  supported_platforms_pids = try(local.m153["supported_platforms_pids"], null)
  vendor = try(local.m153["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m153["ancestors"], null) == null ? [] : local.m153["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m153["parent"], null) == null ? [] : local.m153["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m153["permission_resources"], null) == null ? [] : local.m153["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m153["tags"], null) == null ? [] : local.m153["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m153["version_context"], null) == null ? [] : local.m153["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
