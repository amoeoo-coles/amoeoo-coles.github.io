# Sample data source intersight_workflow_task_metadata — reads ../models/data_intersight_workflow_task_metadata.yml
locals { m1539 = yamldecode(file("${path.module}/../models/data_intersight_workflow_task_metadata.yml"))["data_intersight_workflow_task_metadata"] }

data "intersight_workflow_task_metadata" "n1539" {
  account_moid = try(local.m1539["account_moid"], null)
  additional_properties = try(local.m1539["additional_properties"], null)
  class_id = try(local.m1539["class_id"], null)
  create_time = try(local.m1539["create_time"], null)
  description = try(local.m1539["description"], null)
  domain_group_moid = try(local.m1539["domain_group_moid"], null)
  id = try(local.m1539["id"], null)
  label = try(local.m1539["label"], null)
  mod_time = try(local.m1539["mod_time"], null)
  moid = try(local.m1539["moid"], null)
  name = try(local.m1539["name"], null)
  object_type = try(local.m1539["object_type"], null)
  owners = try(local.m1539["owners"], null)
  results = try(local.m1539["results"], null)
  shared_scope = try(local.m1539["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1539["ancestors"], null) == null ? [] : local.m1539["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_privilege_sets" {
    for_each = try(local.m1539["associated_privilege_sets"], null) == null ? [] : local.m1539["associated_privilege_sets"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_roles" {
    for_each = try(local.m1539["associated_roles"], null) == null ? [] : local.m1539["associated_roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1539["catalog"], null) == null ? [] : local.m1539["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1539["parent"], null) == null ? [] : local.m1539["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1539["permission_resources"], null) == null ? [] : local.m1539["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1539["tags"], null) == null ? [] : local.m1539["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1539["version_context"], null) == null ? [] : local.m1539["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
