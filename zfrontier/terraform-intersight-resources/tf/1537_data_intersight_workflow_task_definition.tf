# Sample data source intersight_workflow_task_definition — reads ../models/data_intersight_workflow_task_definition.yml
locals { m1537 = yamldecode(file("${path.module}/../models/data_intersight_workflow_task_definition.yml"))["data_intersight_workflow_task_definition"] }

data "intersight_workflow_task_definition" "n1537" {
  account_moid = try(local.m1537["account_moid"], null)
  additional_properties = try(local.m1537["additional_properties"], null)
  class_id = try(local.m1537["class_id"], null)
  create_time = try(local.m1537["create_time"], null)
  default_version = try(local.m1537["default_version"], null)
  description = try(local.m1537["description"], null)
  domain_group_moid = try(local.m1537["domain_group_moid"], null)
  id = try(local.m1537["id"], null)
  label = try(local.m1537["label"], null)
  license_entitlement = try(local.m1537["license_entitlement"], null)
  mod_time = try(local.m1537["mod_time"], null)
  moid = try(local.m1537["moid"], null)
  name = try(local.m1537["name"], null)
  nr_version = try(local.m1537["nr_version"], null)
  object_type = try(local.m1537["object_type"], null)
  owners = try(local.m1537["owners"], null)
  results = try(local.m1537["results"], null)
  secure_prop_access = try(local.m1537["secure_prop_access"], null)
  shared_scope = try(local.m1537["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1537["ancestors"], null) == null ? [] : local.m1537["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1537["catalog"], null) == null ? [] : local.m1537["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cloned_from" {
    for_each = try(local.m1537["cloned_from"], null) == null ? [] : local.m1537["cloned_from"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "implemented_tasks" {
    for_each = try(local.m1537["implemented_tasks"], null) == null ? [] : local.m1537["implemented_tasks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "interface_task" {
    for_each = try(local.m1537["interface_task"], null) == null ? [] : local.m1537["interface_task"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "internal_properties" {
    for_each = try(local.m1537["internal_properties"], null) == null ? [] : local.m1537["internal_properties"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1537["parent"], null) == null ? [] : local.m1537["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1537["permission_resources"], null) == null ? [] : local.m1537["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "properties" {
    for_each = try(local.m1537["properties"], null) == null ? [] : local.m1537["properties"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "rollback_tasks" {
    for_each = try(local.m1537["rollback_tasks"], null) == null ? [] : local.m1537["rollback_tasks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1537["tags"], null) == null ? [] : local.m1537["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "task_metadata" {
    for_each = try(local.m1537["task_metadata"], null) == null ? [] : local.m1537["task_metadata"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1537["version_context"], null) == null ? [] : local.m1537["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
