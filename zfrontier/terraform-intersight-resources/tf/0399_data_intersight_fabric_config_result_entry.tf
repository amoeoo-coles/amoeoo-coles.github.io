# Sample data source intersight_fabric_config_result_entry — reads ../models/data_intersight_fabric_config_result_entry.yml
locals { m399 = yamldecode(file("${path.module}/../models/data_intersight_fabric_config_result_entry.yml"))["data_intersight_fabric_config_result_entry"] }

data "intersight_fabric_config_result_entry" "n399" {
  account_moid = try(local.m399["account_moid"], null)
  additional_properties = try(local.m399["additional_properties"], null)
  class_id = try(local.m399["class_id"], null)
  completed_time = try(local.m399["completed_time"], null)
  create_time = try(local.m399["create_time"], null)
  domain_group_moid = try(local.m399["domain_group_moid"], null)
  id = try(local.m399["id"], null)
  message = try(local.m399["message"], null)
  mod_time = try(local.m399["mod_time"], null)
  moid = try(local.m399["moid"], null)
  object_type = try(local.m399["object_type"], null)
  owner_id = try(local.m399["owner_id"], null)
  owners = try(local.m399["owners"], null)
  results = try(local.m399["results"], null)
  shared_scope = try(local.m399["shared_scope"], null)
  state = try(local.m399["state"], null)
  type = try(local.m399["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m399["ancestors"], null) == null ? [] : local.m399["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_result" {
    for_each = try(local.m399["config_result"], null) == null ? [] : local.m399["config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "context" {
    for_each = try(local.m399["context"], null) == null ? [] : local.m399["context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m399["parent"], null) == null ? [] : local.m399["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m399["permission_resources"], null) == null ? [] : local.m399["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m399["tags"], null) == null ? [] : local.m399["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m399["version_context"], null) == null ? [] : local.m399["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
