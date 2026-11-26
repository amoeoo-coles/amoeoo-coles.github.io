# Sample data source intersight_workflow_variable — reads ../models/data_intersight_workflow_variable.yml
locals { m1542 = yamldecode(file("${path.module}/../models/data_intersight_workflow_variable.yml"))["data_intersight_workflow_variable"] }

data "intersight_workflow_variable" "n1542" {
  account_moid = try(local.m1542["account_moid"], null)
  additional_properties = try(local.m1542["additional_properties"], null)
  class_id = try(local.m1542["class_id"], null)
  create_time = try(local.m1542["create_time"], null)
  create_user = try(local.m1542["create_user"], null)
  domain_group_moid = try(local.m1542["domain_group_moid"], null)
  id = try(local.m1542["id"], null)
  mod_time = try(local.m1542["mod_time"], null)
  mod_user = try(local.m1542["mod_user"], null)
  moid = try(local.m1542["moid"], null)
  name = try(local.m1542["name"], null)
  object_type = try(local.m1542["object_type"], null)
  owners = try(local.m1542["owners"], null)
  results = try(local.m1542["results"], null)
  shared_scope = try(local.m1542["shared_scope"], null)
  value = try(local.m1542["value"], null)
  dynamic "ancestors" {
    for_each = try(local.m1542["ancestors"], null) == null ? [] : local.m1542["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1542["catalog"], null) == null ? [] : local.m1542["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "definition" {
    for_each = try(local.m1542["definition"], null) == null ? [] : local.m1542["definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1542["parent"], null) == null ? [] : local.m1542["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1542["permission_resources"], null) == null ? [] : local.m1542["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1542["tags"], null) == null ? [] : local.m1542["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1542["version_context"], null) == null ? [] : local.m1542["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
