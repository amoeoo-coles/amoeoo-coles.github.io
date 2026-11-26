# Sample data source intersight_workload_workload_instance — reads ../models/data_intersight_workload_workload_instance.yml
locals { m1557 = yamldecode(file("${path.module}/../models/data_intersight_workload_workload_instance.yml"))["data_intersight_workload_workload_instance"] }

data "intersight_workload_workload_instance" "n1557" {
  account_moid = try(local.m1557["account_moid"], null)
  action = try(local.m1557["action"], null)
  additional_properties = try(local.m1557["additional_properties"], null)
  change_types = try(local.m1557["change_types"], null)
  class_id = try(local.m1557["class_id"], null)
  conformance = try(local.m1557["conformance"], null)
  create_time = try(local.m1557["create_time"], null)
  domain_group_moid = try(local.m1557["domain_group_moid"], null)
  id = try(local.m1557["id"], null)
  last_action = try(local.m1557["last_action"], null)
  mod_time = try(local.m1557["mod_time"], null)
  moid = try(local.m1557["moid"], null)
  name = try(local.m1557["name"], null)
  object_type = try(local.m1557["object_type"], null)
  owners = try(local.m1557["owners"], null)
  results = try(local.m1557["results"], null)
  shared_scope = try(local.m1557["shared_scope"], null)
  status = try(local.m1557["status"], null)
  status_change_reason = try(local.m1557["status_change_reason"], null)
  dynamic "alarm_summary" {
    for_each = try(local.m1557["alarm_summary"], null) == null ? [] : local.m1557["alarm_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1557["ancestors"], null) == null ? [] : local.m1557["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_resources" {
    for_each = try(local.m1557["assigned_resources"], null) == null ? [] : local.m1557["assigned_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "chassis_pool_member" {
    for_each = try(local.m1557["chassis_pool_member"], null) == null ? [] : local.m1557["chassis_pool_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "deployment_input" {
    for_each = try(local.m1557["deployment_input"], null) == null ? [] : local.m1557["deployment_input"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "last_deployment_input" {
    for_each = try(local.m1557["last_deployment_input"], null) == null ? [] : local.m1557["last_deployment_input"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "location_details" {
    for_each = try(local.m1557["location_details"], null) == null ? [] : local.m1557["location_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1557["organization"], null) == null ? [] : local.m1557["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1557["parent"], null) == null ? [] : local.m1557["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1557["permission_resources"], null) == null ? [] : local.m1557["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_item_instances" {
    for_each = try(local.m1557["service_item_instances"], null) == null ? [] : local.m1557["service_item_instances"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1557["tags"], null) == null ? [] : local.m1557["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1557["version_context"], null) == null ? [] : local.m1557["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workload_definition" {
    for_each = try(local.m1557["workload_definition"], null) == null ? [] : local.m1557["workload_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workload_deployment" {
    for_each = try(local.m1557["workload_deployment"], null) == null ? [] : local.m1557["workload_deployment"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
