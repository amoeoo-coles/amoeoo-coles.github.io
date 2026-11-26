# Sample data source intersight_servicenow_incident — reads ../models/data_intersight_servicenow_incident.yml
locals { m1165 = yamldecode(file("${path.module}/../models/data_intersight_servicenow_incident.yml"))["data_intersight_servicenow_incident"] }

data "intersight_servicenow_incident" "n1165" {
  account_moid = try(local.m1165["account_moid"], null)
  additional_properties = try(local.m1165["additional_properties"], null)
  approval = try(local.m1165["approval"], null)
  category = try(local.m1165["category"], null)
  class_id = try(local.m1165["class_id"], null)
  comments = try(local.m1165["comments"], null)
  create_time = try(local.m1165["create_time"], null)
  created_by = try(local.m1165["created_by"], null)
  created_on = try(local.m1165["created_on"], null)
  description = try(local.m1165["description"], null)
  domain_group_moid = try(local.m1165["domain_group_moid"], null)
  due_date = try(local.m1165["due_date"], null)
  expected_start = try(local.m1165["expected_start"], null)
  id = try(local.m1165["id"], null)
  impact = try(local.m1165["impact"], null)
  incident_state = try(local.m1165["incident_state"], null)
  mod_time = try(local.m1165["mod_time"], null)
  moid = try(local.m1165["moid"], null)
  object_type = try(local.m1165["object_type"], null)
  opened_by = try(local.m1165["opened_by"], null)
  owners = try(local.m1165["owners"], null)
  priority = try(local.m1165["priority"], null)
  results = try(local.m1165["results"], null)
  risk = try(local.m1165["risk"], null)
  severity = try(local.m1165["severity"], null)
  shared_scope = try(local.m1165["shared_scope"], null)
  short_description = try(local.m1165["short_description"], null)
  sys_id = try(local.m1165["sys_id"], null)
  task_effective_number = try(local.m1165["task_effective_number"], null)
  updated_by = try(local.m1165["updated_by"], null)
  urgency = try(local.m1165["urgency"], null)
  work_end = try(local.m1165["work_end"], null)
  work_start = try(local.m1165["work_start"], null)
  dynamic "ancestors" {
    for_each = try(local.m1165["ancestors"], null) == null ? [] : local.m1165["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1165["parent"], null) == null ? [] : local.m1165["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1165["permission_resources"], null) == null ? [] : local.m1165["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1165["registered_device"], null) == null ? [] : local.m1165["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1165["tags"], null) == null ? [] : local.m1165["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1165["version_context"], null) == null ? [] : local.m1165["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
