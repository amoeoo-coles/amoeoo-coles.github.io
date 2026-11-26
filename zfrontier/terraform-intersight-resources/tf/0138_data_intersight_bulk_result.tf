# Sample data source intersight_bulk_result — reads ../models/data_intersight_bulk_result.yml
locals { m138 = yamldecode(file("${path.module}/../models/data_intersight_bulk_result.yml"))["data_intersight_bulk_result"] }

data "intersight_bulk_result" "n138" {
  account_moid = try(local.m138["account_moid"], null)
  action_on_error = try(local.m138["action_on_error"], null)
  additional_properties = try(local.m138["additional_properties"], null)
  class_id = try(local.m138["class_id"], null)
  completion_time = try(local.m138["completion_time"], null)
  create_time = try(local.m138["create_time"], null)
  domain_group_moid = try(local.m138["domain_group_moid"], null)
  id = try(local.m138["id"], null)
  mod_time = try(local.m138["mod_time"], null)
  moid = try(local.m138["moid"], null)
  num_sub_requests = try(local.m138["num_sub_requests"], null)
  object_type = try(local.m138["object_type"], null)
  owners = try(local.m138["owners"], null)
  request = try(local.m138["request"], null)
  request_received_time = try(local.m138["request_received_time"], null)
  results = try(local.m138["results"], null)
  shared_scope = try(local.m138["shared_scope"], null)
  status = try(local.m138["status"], null)
  status_message = try(local.m138["status_message"], null)
  uri = try(local.m138["uri"], null)
  dynamic "ancestors" {
    for_each = try(local.m138["ancestors"], null) == null ? [] : local.m138["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mo_cloner" {
    for_each = try(local.m138["mo_cloner"], null) == null ? [] : local.m138["mo_cloner"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mo_deep_cloner" {
    for_each = try(local.m138["mo_deep_cloner"], null) == null ? [] : local.m138["mo_deep_cloner"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mo_merger" {
    for_each = try(local.m138["mo_merger"], null) == null ? [] : local.m138["mo_merger"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m138["organization"], null) == null ? [] : local.m138["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m138["parent"], null) == null ? [] : local.m138["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m138["permission_resources"], null) == null ? [] : local.m138["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m138["tags"], null) == null ? [] : local.m138["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m138["version_context"], null) == null ? [] : local.m138["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_info" {
    for_each = try(local.m138["workflow_info"], null) == null ? [] : local.m138["workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
