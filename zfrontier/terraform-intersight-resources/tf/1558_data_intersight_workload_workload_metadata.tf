# Sample data source intersight_workload_workload_metadata — reads ../models/data_intersight_workload_workload_metadata.yml
locals { m1558 = yamldecode(file("${path.module}/../models/data_intersight_workload_workload_metadata.yml"))["data_intersight_workload_workload_metadata"] }

data "intersight_workload_workload_metadata" "n1558" {
  account_moid = try(local.m1558["account_moid"], null)
  additional_properties = try(local.m1558["additional_properties"], null)
  class_id = try(local.m1558["class_id"], null)
  create_time = try(local.m1558["create_time"], null)
  domain_group_moid = try(local.m1558["domain_group_moid"], null)
  id = try(local.m1558["id"], null)
  mod_time = try(local.m1558["mod_time"], null)
  moid = try(local.m1558["moid"], null)
  object_type = try(local.m1558["object_type"], null)
  owners = try(local.m1558["owners"], null)
  results = try(local.m1558["results"], null)
  shared_scope = try(local.m1558["shared_scope"], null)
  workload_ref_name = try(local.m1558["workload_ref_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1558["ancestors"], null) == null ? [] : local.m1558["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "conformance_summary" {
    for_each = try(local.m1558["conformance_summary"], null) == null ? [] : local.m1558["conformance_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "deployment_summary" {
    for_each = try(local.m1558["deployment_summary"], null) == null ? [] : local.m1558["deployment_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1558["organization"], null) == null ? [] : local.m1558["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1558["parent"], null) == null ? [] : local.m1558["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1558["permission_resources"], null) == null ? [] : local.m1558["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "rename_request" {
    for_each = try(local.m1558["rename_request"], null) == null ? [] : local.m1558["rename_request"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1558["tags"], null) == null ? [] : local.m1558["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1558["version_context"], null) == null ? [] : local.m1558["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
