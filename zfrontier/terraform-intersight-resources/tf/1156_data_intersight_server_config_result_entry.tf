# Sample data source intersight_server_config_result_entry — reads ../models/data_intersight_server_config_result_entry.yml
locals { m1156 = yamldecode(file("${path.module}/../models/data_intersight_server_config_result_entry.yml"))["data_intersight_server_config_result_entry"] }

data "intersight_server_config_result_entry" "n1156" {
  account_moid = try(local.m1156["account_moid"], null)
  additional_properties = try(local.m1156["additional_properties"], null)
  class_id = try(local.m1156["class_id"], null)
  completed_time = try(local.m1156["completed_time"], null)
  create_time = try(local.m1156["create_time"], null)
  domain_group_moid = try(local.m1156["domain_group_moid"], null)
  id = try(local.m1156["id"], null)
  message = try(local.m1156["message"], null)
  mod_time = try(local.m1156["mod_time"], null)
  moid = try(local.m1156["moid"], null)
  object_type = try(local.m1156["object_type"], null)
  owner_id = try(local.m1156["owner_id"], null)
  owners = try(local.m1156["owners"], null)
  results = try(local.m1156["results"], null)
  shared_scope = try(local.m1156["shared_scope"], null)
  state = try(local.m1156["state"], null)
  type = try(local.m1156["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m1156["ancestors"], null) == null ? [] : local.m1156["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_result" {
    for_each = try(local.m1156["config_result"], null) == null ? [] : local.m1156["config_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "context" {
    for_each = try(local.m1156["context"], null) == null ? [] : local.m1156["context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1156["parent"], null) == null ? [] : local.m1156["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1156["permission_resources"], null) == null ? [] : local.m1156["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1156["tags"], null) == null ? [] : local.m1156["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1156["version_context"], null) == null ? [] : local.m1156["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
