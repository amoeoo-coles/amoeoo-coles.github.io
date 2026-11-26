# Sample data source intersight_workflow_template_function_meta — reads ../models/data_intersight_workflow_template_function_meta.yml
locals { m1540 = yamldecode(file("${path.module}/../models/data_intersight_workflow_template_function_meta.yml"))["data_intersight_workflow_template_function_meta"] }

data "intersight_workflow_template_function_meta" "n1540" {
  account_moid = try(local.m1540["account_moid"], null)
  additional_properties = try(local.m1540["additional_properties"], null)
  class_id = try(local.m1540["class_id"], null)
  create_time = try(local.m1540["create_time"], null)
  domain_group_moid = try(local.m1540["domain_group_moid"], null)
  id = try(local.m1540["id"], null)
  is_guided_mode_supported = try(local.m1540["is_guided_mode_supported"], null)
  mod_time = try(local.m1540["mod_time"], null)
  moid = try(local.m1540["moid"], null)
  name = try(local.m1540["name"], null)
  object_type = try(local.m1540["object_type"], null)
  owners = try(local.m1540["owners"], null)
  results = try(local.m1540["results"], null)
  shared_scope = try(local.m1540["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1540["ancestors"], null) == null ? [] : local.m1540["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "comments" {
    for_each = try(local.m1540["comments"], null) == null ? [] : local.m1540["comments"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inputs" {
    for_each = try(local.m1540["inputs"], null) == null ? [] : local.m1540["inputs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "outputs" {
    for_each = try(local.m1540["outputs"], null) == null ? [] : local.m1540["outputs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1540["parent"], null) == null ? [] : local.m1540["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1540["permission_resources"], null) == null ? [] : local.m1540["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1540["tags"], null) == null ? [] : local.m1540["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1540["version_context"], null) == null ? [] : local.m1540["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
