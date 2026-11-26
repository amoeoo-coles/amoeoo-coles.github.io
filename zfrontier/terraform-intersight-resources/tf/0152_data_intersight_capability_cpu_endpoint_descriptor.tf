# Sample data source intersight_capability_cpu_endpoint_descriptor — reads ../models/data_intersight_capability_cpu_endpoint_descriptor.yml
locals { m152 = yamldecode(file("${path.module}/../models/data_intersight_capability_cpu_endpoint_descriptor.yml"))["data_intersight_capability_cpu_endpoint_descriptor"] }

data "intersight_capability_cpu_endpoint_descriptor" "n152" {
  account_moid = try(local.m152["account_moid"], null)
  additional_properties = try(local.m152["additional_properties"], null)
  class_id = try(local.m152["class_id"], null)
  create_time = try(local.m152["create_time"], null)
  description = try(local.m152["description"], null)
  domain_group_moid = try(local.m152["domain_group_moid"], null)
  id = try(local.m152["id"], null)
  mod_time = try(local.m152["mod_time"], null)
  model = try(local.m152["model"], null)
  moid = try(local.m152["moid"], null)
  object_type = try(local.m152["object_type"], null)
  owners = try(local.m152["owners"], null)
  part_number = try(local.m152["part_number"], null)
  pid = try(local.m152["pid"], null)
  results = try(local.m152["results"], null)
  shared_scope = try(local.m152["shared_scope"], null)
  supported_platforms_pids = try(local.m152["supported_platforms_pids"], null)
  vendor = try(local.m152["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m152["ancestors"], null) == null ? [] : local.m152["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m152["parent"], null) == null ? [] : local.m152["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m152["permission_resources"], null) == null ? [] : local.m152["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m152["tags"], null) == null ? [] : local.m152["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m152["version_context"], null) == null ? [] : local.m152["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
