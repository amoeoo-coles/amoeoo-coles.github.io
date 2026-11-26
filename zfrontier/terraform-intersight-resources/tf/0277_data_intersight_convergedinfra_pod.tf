# Sample data source intersight_convergedinfra_pod — reads ../models/data_intersight_convergedinfra_pod.yml
locals { m277 = yamldecode(file("${path.module}/../models/data_intersight_convergedinfra_pod.yml"))["data_intersight_convergedinfra_pod"] }

data "intersight_convergedinfra_pod" "n277" {
  account_moid = try(local.m277["account_moid"], null)
  additional_properties = try(local.m277["additional_properties"], null)
  class_id = try(local.m277["class_id"], null)
  create_time = try(local.m277["create_time"], null)
  deployment_type = try(local.m277["deployment_type"], null)
  description = try(local.m277["description"], null)
  domain_group_moid = try(local.m277["domain_group_moid"], null)
  id = try(local.m277["id"], null)
  interop_status = try(local.m277["interop_status"], null)
  mod_time = try(local.m277["mod_time"], null)
  moid = try(local.m277["moid"], null)
  name = try(local.m277["name"], null)
  object_type = try(local.m277["object_type"], null)
  owners = try(local.m277["owners"], null)
  results = try(local.m277["results"], null)
  shared_scope = try(local.m277["shared_scope"], null)
  type = try(local.m277["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m277["ancestors"], null) == null ? [] : local.m277["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m277["organization"], null) == null ? [] : local.m277["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m277["parent"], null) == null ? [] : local.m277["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m277["permission_resources"], null) == null ? [] : local.m277["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pod_compliance" {
    for_each = try(local.m277["pod_compliance"], null) == null ? [] : local.m277["pod_compliance"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pod_resource_group" {
    for_each = try(local.m277["pod_resource_group"], null) == null ? [] : local.m277["pod_resource_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_item_instance" {
    for_each = try(local.m277["service_item_instance"], null) == null ? [] : local.m277["service_item_instance"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "summary" {
    for_each = try(local.m277["summary"], null) == null ? [] : local.m277["summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m277["tags"], null) == null ? [] : local.m277["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m277["version_context"], null) == null ? [] : local.m277["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
