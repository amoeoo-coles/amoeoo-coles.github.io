# Sample data source intersight_workflow_ui_display_metadata — reads ../models/data_intersight_workflow_ui_display_metadata.yml
locals { m1541 = yamldecode(file("${path.module}/../models/data_intersight_workflow_ui_display_metadata.yml"))["data_intersight_workflow_ui_display_metadata"] }

data "intersight_workflow_ui_display_metadata" "n1541" {
  account_moid = try(local.m1541["account_moid"], null)
  additional_properties = try(local.m1541["additional_properties"], null)
  class_id = try(local.m1541["class_id"], null)
  create_time = try(local.m1541["create_time"], null)
  domain_group_moid = try(local.m1541["domain_group_moid"], null)
  id = try(local.m1541["id"], null)
  mod_time = try(local.m1541["mod_time"], null)
  moid = try(local.m1541["moid"], null)
  object_type = try(local.m1541["object_type"], null)
  owners = try(local.m1541["owners"], null)
  results = try(local.m1541["results"], null)
  shared_scope = try(local.m1541["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1541["ancestors"], null) == null ? [] : local.m1541["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "meta_definition" {
    for_each = try(local.m1541["meta_definition"], null) == null ? [] : local.m1541["meta_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1541["parent"], null) == null ? [] : local.m1541["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1541["permission_resources"], null) == null ? [] : local.m1541["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1541["tags"], null) == null ? [] : local.m1541["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ui_form_configs" {
    for_each = try(local.m1541["ui_form_configs"], null) == null ? [] : local.m1541["ui_form_configs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ui_view_configs" {
    for_each = try(local.m1541["ui_view_configs"], null) == null ? [] : local.m1541["ui_view_configs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1541["version_context"], null) == null ? [] : local.m1541["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
