# Sample data source intersight_onprem_audit_record — reads ../models/data_intersight_onprem_audit_record.yml
locals { m1015 = yamldecode(file("${path.module}/../models/data_intersight_onprem_audit_record.yml"))["data_intersight_onprem_audit_record"] }

data "intersight_onprem_audit_record" "n1015" {
  account_moid = try(local.m1015["account_moid"], null)
  additional_properties = try(local.m1015["additional_properties"], null)
  class_id = try(local.m1015["class_id"], null)
  create_time = try(local.m1015["create_time"], null)
  domain_group_moid = try(local.m1015["domain_group_moid"], null)
  event = try(local.m1015["event"], null)
  http_operation = try(local.m1015["http_operation"], null)
  http_response_code = try(local.m1015["http_response_code"], null)
  http_response_payload = try(local.m1015["http_response_payload"], null)
  id = try(local.m1015["id"], null)
  mo_type = try(local.m1015["mo_type"], null)
  mod_time = try(local.m1015["mod_time"], null)
  moid = try(local.m1015["moid"], null)
  object_moid = try(local.m1015["object_moid"], null)
  object_name = try(local.m1015["object_name"], null)
  object_type = try(local.m1015["object_type"], null)
  owners = try(local.m1015["owners"], null)
  request = try(local.m1015["request"], null)
  results = try(local.m1015["results"], null)
  session_id = try(local.m1015["session_id"], null)
  shared_scope = try(local.m1015["shared_scope"], null)
  source_ip = try(local.m1015["source_ip"], null)
  timestamp = try(local.m1015["timestamp"], null)
  trace_id = try(local.m1015["trace_id"], null)
  user_agent_string = try(local.m1015["user_agent_string"], null)
  user_id_or_email = try(local.m1015["user_id_or_email"], null)
  dynamic "ancestors" {
    for_each = try(local.m1015["ancestors"], null) == null ? [] : local.m1015["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1015["parent"], null) == null ? [] : local.m1015["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1015["permission_resources"], null) == null ? [] : local.m1015["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1015["tags"], null) == null ? [] : local.m1015["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1015["version_context"], null) == null ? [] : local.m1015["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
