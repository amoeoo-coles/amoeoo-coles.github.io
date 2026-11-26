# Sample data source intersight_workload_workload_deployment — reads ../models/data_intersight_workload_workload_deployment.yml
locals { m1556 = yamldecode(file("${path.module}/../models/data_intersight_workload_workload_deployment.yml"))["data_intersight_workload_workload_deployment"] }

data "intersight_workload_workload_deployment" "n1556" {
  account_moid = try(local.m1556["account_moid"], null)
  action = try(local.m1556["action"], null)
  additional_properties = try(local.m1556["additional_properties"], null)
  class_id = try(local.m1556["class_id"], null)
  conformance = try(local.m1556["conformance"], null)
  create_time = try(local.m1556["create_time"], null)
  description = try(local.m1556["description"], null)
  digit_count = try(local.m1556["digit_count"], null)
  domain_group_moid = try(local.m1556["domain_group_moid"], null)
  id = try(local.m1556["id"], null)
  last_action = try(local.m1556["last_action"], null)
  last_instance_index = try(local.m1556["last_instance_index"], null)
  mod_time = try(local.m1556["mod_time"], null)
  moid = try(local.m1556["moid"], null)
  name = try(local.m1556["name"], null)
  object_type = try(local.m1556["object_type"], null)
  owners = try(local.m1556["owners"], null)
  ref_name = try(local.m1556["ref_name"], null)
  results = try(local.m1556["results"], null)
  shared_scope = try(local.m1556["shared_scope"], null)
  start_index_for_suffix = try(local.m1556["start_index_for_suffix"], null)
  status = try(local.m1556["status"], null)
  workload_instance_prefix = try(local.m1556["workload_instance_prefix"], null)
  dynamic "ancestors" {
    for_each = try(local.m1556["ancestors"], null) == null ? [] : local.m1556["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "blueprints" {
    for_each = try(local.m1556["blueprints"], null) == null ? [] : local.m1556["blueprints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "change_details" {
    for_each = try(local.m1556["change_details"], null) == null ? [] : local.m1556["change_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "deployment_input" {
    for_each = try(local.m1556["deployment_input"], null) == null ? [] : local.m1556["deployment_input"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "deployment_input_history" {
    for_each = try(local.m1556["deployment_input_history"], null) == null ? [] : local.m1556["deployment_input_history"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "instance_conformance_summary" {
    for_each = try(local.m1556["instance_conformance_summary"], null) == null ? [] : local.m1556["instance_conformance_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "instance_status_summary" {
    for_each = try(local.m1556["instance_status_summary"], null) == null ? [] : local.m1556["instance_status_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1556["organization"], null) == null ? [] : local.m1556["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1556["parent"], null) == null ? [] : local.m1556["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1556["permission_resources"], null) == null ? [] : local.m1556["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "qualification_policies" {
    for_each = try(local.m1556["qualification_policies"], null) == null ? [] : local.m1556["qualification_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "qualifiers" {
    for_each = try(local.m1556["qualifiers"], null) == null ? [] : local.m1556["qualifiers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "rename_request" {
    for_each = try(local.m1556["rename_request"], null) == null ? [] : local.m1556["rename_request"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_pool" {
    for_each = try(local.m1556["resource_pool"], null) == null ? [] : local.m1556["resource_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "rollout_strategy" {
    for_each = try(local.m1556["rollout_strategy"], null) == null ? [] : local.m1556["rollout_strategy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "schedule_policy" {
    for_each = try(local.m1556["schedule_policy"], null) == null ? [] : local.m1556["schedule_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1556["tags"], null) == null ? [] : local.m1556["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "task_schedule" {
    for_each = try(local.m1556["task_schedule"], null) == null ? [] : local.m1556["task_schedule"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "validation_information" {
    for_each = try(local.m1556["validation_information"], null) == null ? [] : local.m1556["validation_information"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1556["version_context"], null) == null ? [] : local.m1556["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workload_definition" {
    for_each = try(local.m1556["workload_definition"], null) == null ? [] : local.m1556["workload_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workload_definition_reference" {
    for_each = try(local.m1556["workload_definition_reference"], null) == null ? [] : local.m1556["workload_definition_reference"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
