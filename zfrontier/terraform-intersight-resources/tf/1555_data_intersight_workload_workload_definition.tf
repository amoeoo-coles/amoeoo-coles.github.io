# Sample data source intersight_workload_workload_definition — reads ../models/data_intersight_workload_workload_definition.yml
locals { m1555 = yamldecode(file("${path.module}/../models/data_intersight_workload_workload_definition.yml"))["data_intersight_workload_workload_definition"] }

data "intersight_workload_workload_definition" "n1555" {
  account_moid = try(local.m1555["account_moid"], null)
  additional_properties = try(local.m1555["additional_properties"], null)
  blueprint_update_by_date = try(local.m1555["blueprint_update_by_date"], null)
  blueprint_version_update_status = try(local.m1555["blueprint_version_update_status"], null)
  class_id = try(local.m1555["class_id"], null)
  create_time = try(local.m1555["create_time"], null)
  description = try(local.m1555["description"], null)
  domain_group_moid = try(local.m1555["domain_group_moid"], null)
  id = try(local.m1555["id"], null)
  mod_time = try(local.m1555["mod_time"], null)
  moid = try(local.m1555["moid"], null)
  name = try(local.m1555["name"], null)
  nr_version = try(local.m1555["nr_version"], null)
  object_type = try(local.m1555["object_type"], null)
  owners = try(local.m1555["owners"], null)
  platform_type = try(local.m1555["platform_type"], null)
  preferred_version = try(local.m1555["preferred_version"], null)
  ref_name = try(local.m1555["ref_name"], null)
  results = try(local.m1555["results"], null)
  shared_scope = try(local.m1555["shared_scope"], null)
  status = try(local.m1555["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m1555["ancestors"], null) == null ? [] : local.m1555["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "blueprints" {
    for_each = try(local.m1555["blueprints"], null) == null ? [] : local.m1555["blueprints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "deployment_summary" {
    for_each = try(local.m1555["deployment_summary"], null) == null ? [] : local.m1555["deployment_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1555["organization"], null) == null ? [] : local.m1555["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1555["parent"], null) == null ? [] : local.m1555["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1555["permission_resources"], null) == null ? [] : local.m1555["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "preferred_version_rollout_strategy" {
    for_each = try(local.m1555["preferred_version_rollout_strategy"], null) == null ? [] : local.m1555["preferred_version_rollout_strategy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1555["tags"], null) == null ? [] : local.m1555["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "validation_information" {
    for_each = try(local.m1555["validation_information"], null) == null ? [] : local.m1555["validation_information"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1555["version_context"], null) == null ? [] : local.m1555["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workload_metadata" {
    for_each = try(local.m1555["workload_metadata"], null) == null ? [] : local.m1555["workload_metadata"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
