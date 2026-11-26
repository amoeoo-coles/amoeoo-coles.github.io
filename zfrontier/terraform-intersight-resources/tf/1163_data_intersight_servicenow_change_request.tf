# Sample data source intersight_servicenow_change_request — reads ../models/data_intersight_servicenow_change_request.yml
locals { m1163 = yamldecode(file("${path.module}/../models/data_intersight_servicenow_change_request.yml"))["data_intersight_servicenow_change_request"] }

data "intersight_servicenow_change_request" "n1163" {
  account_moid = try(local.m1163["account_moid"], null)
  additional_properties = try(local.m1163["additional_properties"], null)
  approval = try(local.m1163["approval"], null)
  assigned_to = try(local.m1163["assigned_to"], null)
  assigned_to_display_value = try(local.m1163["assigned_to_display_value"], null)
  change_model = try(local.m1163["change_model"], null)
  change_model_display_value = try(local.m1163["change_model_display_value"], null)
  change_request_number = try(local.m1163["change_request_number"], null)
  class_id = try(local.m1163["class_id"], null)
  comments = try(local.m1163["comments"], null)
  create_time = try(local.m1163["create_time"], null)
  created_by = try(local.m1163["created_by"], null)
  description = try(local.m1163["description"], null)
  domain_group_moid = try(local.m1163["domain_group_moid"], null)
  due_date = try(local.m1163["due_date"], null)
  end_date = try(local.m1163["end_date"], null)
  id = try(local.m1163["id"], null)
  impact = try(local.m1163["impact"], null)
  impact_display_value = try(local.m1163["impact_display_value"], null)
  mod_time = try(local.m1163["mod_time"], null)
  moid = try(local.m1163["moid"], null)
  object_type = try(local.m1163["object_type"], null)
  owners = try(local.m1163["owners"], null)
  priority = try(local.m1163["priority"], null)
  priority_display_value = try(local.m1163["priority_display_value"], null)
  results = try(local.m1163["results"], null)
  risk = try(local.m1163["risk"], null)
  shared_scope = try(local.m1163["shared_scope"], null)
  short_description = try(local.m1163["short_description"], null)
  start_date = try(local.m1163["start_date"], null)
  sys_id = try(local.m1163["sys_id"], null)
  type = try(local.m1163["type"], null)
  updated_by = try(local.m1163["updated_by"], null)
  dynamic "ancestors" {
    for_each = try(local.m1163["ancestors"], null) == null ? [] : local.m1163["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1163["parent"], null) == null ? [] : local.m1163["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1163["permission_resources"], null) == null ? [] : local.m1163["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1163["registered_device"], null) == null ? [] : local.m1163["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1163["tags"], null) == null ? [] : local.m1163["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1163["version_context"], null) == null ? [] : local.m1163["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
