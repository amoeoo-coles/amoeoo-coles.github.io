# Sample data source intersight_workload_deployment_input — reads ../models/data_intersight_workload_deployment_input.yml
locals { m1553 = yamldecode(file("${path.module}/../models/data_intersight_workload_deployment_input.yml"))["data_intersight_workload_deployment_input"] }

data "intersight_workload_deployment_input" "n1553" {
  account_moid = try(local.m1553["account_moid"], null)
  additional_properties = try(local.m1553["additional_properties"], null)
  class_id = try(local.m1553["class_id"], null)
  create_time = try(local.m1553["create_time"], null)
  domain_group_moid = try(local.m1553["domain_group_moid"], null)
  gen_number = try(local.m1553["gen_number"], null)
  id = try(local.m1553["id"], null)
  mod_time = try(local.m1553["mod_time"], null)
  moid = try(local.m1553["moid"], null)
  object_generation_failed = try(local.m1553["object_generation_failed"], null)
  object_type = try(local.m1553["object_type"], null)
  owners = try(local.m1553["owners"], null)
  results = try(local.m1553["results"], null)
  shared_scope = try(local.m1553["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1553["ancestors"], null) == null ? [] : local.m1553["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "deferred_cleanup_input" {
    for_each = try(local.m1553["deferred_cleanup_input"], null) == null ? [] : local.m1553["deferred_cleanup_input"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "input" {
    for_each = try(local.m1553["input"], null) == null ? [] : local.m1553["input"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1553["parent"], null) == null ? [] : local.m1553["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1553["permission_resources"], null) == null ? [] : local.m1553["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1553["tags"], null) == null ? [] : local.m1553["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1553["version_context"], null) == null ? [] : local.m1553["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workload_deployment" {
    for_each = try(local.m1553["workload_deployment"], null) == null ? [] : local.m1553["workload_deployment"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
