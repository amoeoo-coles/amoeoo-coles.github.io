# Sample data source intersight_bulk_request — reads ../models/data_intersight_bulk_request.yml
locals { m137 = yamldecode(file("${path.module}/../models/data_intersight_bulk_request.yml"))["data_intersight_bulk_request"] }

data "intersight_bulk_request" "n137" {
  account_moid = try(local.m137["account_moid"], null)
  action_on_error = try(local.m137["action_on_error"], null)
  actions = try(local.m137["actions"], null)
  additional_properties = try(local.m137["additional_properties"], null)
  class_id = try(local.m137["class_id"], null)
  completion_time = try(local.m137["completion_time"], null)
  create_time = try(local.m137["create_time"], null)
  domain_group_moid = try(local.m137["domain_group_moid"], null)
  id = try(local.m137["id"], null)
  is_backup_encryption_key_set = try(var.secrets["data_intersight_bulk_request.is_backup_encryption_key_set"], local.m137["is_backup_encryption_key_set"])
  mod_time = try(local.m137["mod_time"], null)
  moid = try(local.m137["moid"], null)
  num_sub_requests = try(local.m137["num_sub_requests"], null)
  object_type = try(local.m137["object_type"], null)
  org_moid = try(local.m137["org_moid"], null)
  owners = try(local.m137["owners"], null)
  request_received_time = try(local.m137["request_received_time"], null)
  results = try(local.m137["results"], null)
  shared_scope = try(local.m137["shared_scope"], null)
  skip_duplicates = try(local.m137["skip_duplicates"], null)
  status = try(local.m137["status"], null)
  status_message = try(local.m137["status_message"], null)
  uri = try(local.m137["uri"], null)
  verb = try(local.m137["verb"], null)
  dynamic "account" {
    for_each = try(local.m137["account"], null) == null ? [] : local.m137["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m137["ancestors"], null) == null ? [] : local.m137["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "async_results" {
    for_each = try(local.m137["async_results"], null) == null ? [] : local.m137["async_results"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "async_results_failed" {
    for_each = try(local.m137["async_results_failed"], null) == null ? [] : local.m137["async_results_failed"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "headers" {
    for_each = try(local.m137["headers"], null) == null ? [] : local.m137["headers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m137["organization"], null) == null ? [] : local.m137["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m137["parent"], null) == null ? [] : local.m137["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m137["permission_resources"], null) == null ? [] : local.m137["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "requests" {
    for_each = try(local.m137["requests"], null) == null ? [] : local.m137["requests"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m137["tags"], null) == null ? [] : local.m137["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m137["version_context"], null) == null ? [] : local.m137["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_info" {
    for_each = try(local.m137["workflow_info"], null) == null ? [] : local.m137["workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
