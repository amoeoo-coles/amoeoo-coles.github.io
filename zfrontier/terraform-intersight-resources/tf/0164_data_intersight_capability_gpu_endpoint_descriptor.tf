# Sample data source intersight_capability_gpu_endpoint_descriptor — reads ../models/data_intersight_capability_gpu_endpoint_descriptor.yml
locals { m164 = yamldecode(file("${path.module}/../models/data_intersight_capability_gpu_endpoint_descriptor.yml"))["data_intersight_capability_gpu_endpoint_descriptor"] }

data "intersight_capability_gpu_endpoint_descriptor" "n164" {
  account_moid = try(local.m164["account_moid"], null)
  additional_properties = try(local.m164["additional_properties"], null)
  class_id = try(local.m164["class_id"], null)
  create_time = try(local.m164["create_time"], null)
  description = try(local.m164["description"], null)
  domain_group_moid = try(local.m164["domain_group_moid"], null)
  id = try(local.m164["id"], null)
  mod_time = try(local.m164["mod_time"], null)
  model = try(local.m164["model"], null)
  moid = try(local.m164["moid"], null)
  object_type = try(local.m164["object_type"], null)
  owners = try(local.m164["owners"], null)
  part_number = try(local.m164["part_number"], null)
  pid = try(local.m164["pid"], null)
  results = try(local.m164["results"], null)
  shared_scope = try(local.m164["shared_scope"], null)
  supported_platforms_pids = try(local.m164["supported_platforms_pids"], null)
  vendor = try(local.m164["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m164["ancestors"], null) == null ? [] : local.m164["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m164["parent"], null) == null ? [] : local.m164["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m164["permission_resources"], null) == null ? [] : local.m164["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m164["tags"], null) == null ? [] : local.m164["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m164["version_context"], null) == null ? [] : local.m164["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
