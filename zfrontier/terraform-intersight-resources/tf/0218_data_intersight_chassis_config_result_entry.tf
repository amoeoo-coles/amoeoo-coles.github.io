# Sample data source intersight_chassis_config_result_entry — reads ../models/data_intersight_chassis_config_result_entry.yml
locals { m218 = yamldecode(file("${path.module}/../models/data_intersight_chassis_config_result_entry.yml"))["data_intersight_chassis_config_result_entry"] }

data "intersight_chassis_config_result_entry" "n218" {
  account_moid = try(local.m218["account_moid"], null)
  additional_properties = try(local.m218["additional_properties"], null)
  class_id = try(local.m218["class_id"], null)
  completed_time = try(local.m218["completed_time"], null)
  create_time = try(local.m218["create_time"], null)
  domain_group_moid = try(local.m218["domain_group_moid"], null)
  id = try(local.m218["id"], null)
  message = try(local.m218["message"], null)
  mod_time = try(local.m218["mod_time"], null)
  moid = try(local.m218["moid"], null)
  object_type = try(local.m218["object_type"], null)
  owner_id = try(local.m218["owner_id"], null)
  owners = try(local.m218["owners"], null)
  results = try(local.m218["results"], null)
  shared_scope = try(local.m218["shared_scope"], null)
  state = try(local.m218["state"], null)
  type = try(local.m218["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m218["ancestors"], null) == null ? [] : local.m218["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_result" {
    for_each = try(local.m218["config_result"], null) == null ? [] : local.m218["config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "context" {
    for_each = try(local.m218["context"], null) == null ? [] : local.m218["context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m218["parent"], null) == null ? [] : local.m218["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m218["permission_resources"], null) == null ? [] : local.m218["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m218["tags"], null) == null ? [] : local.m218["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m218["version_context"], null) == null ? [] : local.m218["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
