# Sample data source intersight_aaa_audit_record — reads ../models/data_intersight_aaa_audit_record.yml
locals { m002 = yamldecode(file("${path.module}/../models/data_intersight_aaa_audit_record.yml"))["data_intersight_aaa_audit_record"] }

data "intersight_aaa_audit_record" "n002" {
  account_moid = try(local.m002["account_moid"], null)
  additional_properties = try(local.m002["additional_properties"], null)
  affected_object_type_label = try(local.m002["affected_object_type_label"], null)
  class_id = try(local.m002["class_id"], null)
  create_time = try(local.m002["create_time"], null)
  domain_group_moid = try(local.m002["domain_group_moid"], null)
  email = try(local.m002["email"], null)
  event = try(local.m002["event"], null)
  http_operation = try(local.m002["http_operation"], null)
  http_response_code = try(local.m002["http_response_code"], null)
  http_response_payload = try(local.m002["http_response_payload"], null)
  id = try(local.m002["id"], null)
  inst_id = try(local.m002["inst_id"], null)
  mo_display_names = try(local.m002["mo_display_names"], null)
  mo_type = try(local.m002["mo_type"], null)
  mod_time = try(local.m002["mod_time"], null)
  moid = try(local.m002["moid"], null)
  object_moid = try(local.m002["object_moid"], null)
  object_type = try(local.m002["object_type"], null)
  owners = try(local.m002["owners"], null)
  request = try(local.m002["request"], null)
  results = try(local.m002["results"], null)
  session_id = try(local.m002["session_id"], null)
  shared_scope = try(local.m002["shared_scope"], null)
  source_ip = try(local.m002["source_ip"], null)
  timestamp = try(local.m002["timestamp"], null)
  trace_id = try(local.m002["trace_id"], null)
  user_agent_string = try(local.m002["user_agent_string"], null)
  user_id_or_email = try(local.m002["user_id_or_email"], null)
  dynamic "account" {
    for_each = try(local.m002["account"], null) == null ? [] : local.m002["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m002["ancestors"], null) == null ? [] : local.m002["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m002["parent"], null) == null ? [] : local.m002["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m002["permission_resources"], null) == null ? [] : local.m002["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sessions" {
    for_each = try(local.m002["sessions"], null) == null ? [] : local.m002["sessions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m002["tags"], null) == null ? [] : local.m002["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m002["user"], null) == null ? [] : local.m002["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user_agent" {
    for_each = try(local.m002["user_agent"], null) == null ? [] : local.m002["user_agent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m002["version_context"], null) == null ? [] : local.m002["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
