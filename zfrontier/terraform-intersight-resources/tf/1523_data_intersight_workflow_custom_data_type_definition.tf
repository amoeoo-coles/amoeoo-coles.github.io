# Sample data source intersight_workflow_custom_data_type_definition — reads ../models/data_intersight_workflow_custom_data_type_definition.yml
locals { m1523 = yamldecode(file("${path.module}/../models/data_intersight_workflow_custom_data_type_definition.yml"))["data_intersight_workflow_custom_data_type_definition"] }

data "intersight_workflow_custom_data_type_definition" "n1523" {
  account_moid = try(local.m1523["account_moid"], null)
  additional_properties = try(local.m1523["additional_properties"], null)
  class_id = try(local.m1523["class_id"], null)
  composite_type = try(local.m1523["composite_type"], null)
  create_time = try(local.m1523["create_time"], null)
  description = try(local.m1523["description"], null)
  domain_group_moid = try(local.m1523["domain_group_moid"], null)
  id = try(local.m1523["id"], null)
  label = try(local.m1523["label"], null)
  mod_time = try(local.m1523["mod_time"], null)
  moid = try(local.m1523["moid"], null)
  name = try(local.m1523["name"], null)
  object_type = try(local.m1523["object_type"], null)
  owners = try(local.m1523["owners"], null)
  results = try(local.m1523["results"], null)
  shared_scope = try(local.m1523["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1523["ancestors"], null) == null ? [] : local.m1523["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1523["catalog"], null) == null ? [] : local.m1523["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cloned_from" {
    for_each = try(local.m1523["cloned_from"], null) == null ? [] : local.m1523["cloned_from"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "constraints" {
    for_each = try(local.m1523["constraints"], null) == null ? [] : local.m1523["constraints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parameter_set" {
    for_each = try(local.m1523["parameter_set"], null) == null ? [] : local.m1523["parameter_set"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1523["parent"], null) == null ? [] : local.m1523["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1523["permission_resources"], null) == null ? [] : local.m1523["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "properties" {
    for_each = try(local.m1523["properties"], null) == null ? [] : local.m1523["properties"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1523["tags"], null) == null ? [] : local.m1523["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "type_definition" {
    for_each = try(local.m1523["type_definition"], null) == null ? [] : local.m1523["type_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1523["version_context"], null) == null ? [] : local.m1523["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
