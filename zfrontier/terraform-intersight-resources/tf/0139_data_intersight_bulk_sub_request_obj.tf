# Sample data source intersight_bulk_sub_request_obj — reads ../models/data_intersight_bulk_sub_request_obj.yml
locals { m139 = yamldecode(file("${path.module}/../models/data_intersight_bulk_sub_request_obj.yml"))["data_intersight_bulk_sub_request_obj"] }

data "intersight_bulk_sub_request_obj" "n139" {
  account_moid = try(local.m139["account_moid"], null)
  additional_properties = try(local.m139["additional_properties"], null)
  body_string = try(local.m139["body_string"], null)
  class_id = try(local.m139["class_id"], null)
  create_time = try(local.m139["create_time"], null)
  domain_group_moid = try(local.m139["domain_group_moid"], null)
  execution_completion_time = try(local.m139["execution_completion_time"], null)
  execution_start_time = try(local.m139["execution_start_time"], null)
  id = try(local.m139["id"], null)
  is_bulk_mo_op = try(local.m139["is_bulk_mo_op"], null)
  is_object_present = try(local.m139["is_object_present"], null)
  mod_time = try(local.m139["mod_time"], null)
  moid = try(local.m139["moid"], null)
  object_type = try(local.m139["object_type"], null)
  owners = try(local.m139["owners"], null)
  results = try(local.m139["results"], null)
  shared_scope = try(local.m139["shared_scope"], null)
  skip_duplicates = try(local.m139["skip_duplicates"], null)
  status = try(local.m139["status"], null)
  system_defined_object_detected = try(local.m139["system_defined_object_detected"], null)
  target_moid = try(local.m139["target_moid"], null)
  uri = try(local.m139["uri"], null)
  verb = try(local.m139["verb"], null)
  dynamic "ancestors" {
    for_each = try(local.m139["ancestors"], null) == null ? [] : local.m139["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "async_request" {
    for_each = try(local.m139["async_request"], null) == null ? [] : local.m139["async_request"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "body" {
    for_each = try(local.m139["body"], null) == null ? [] : local.m139["body"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m139["parent"], null) == null ? [] : local.m139["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m139["permission_resources"], null) == null ? [] : local.m139["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "request" {
    for_each = try(local.m139["request"], null) == null ? [] : local.m139["request"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "result" {
    for_each = try(local.m139["result"], null) == null ? [] : local.m139["result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m139["tags"], null) == null ? [] : local.m139["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m139["version_context"], null) == null ? [] : local.m139["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
