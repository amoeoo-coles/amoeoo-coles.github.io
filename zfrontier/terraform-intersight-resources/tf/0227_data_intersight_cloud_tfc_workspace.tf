# Sample data source intersight_cloud_tfc_workspace — reads ../models/data_intersight_cloud_tfc_workspace.yml
locals { m227 = yamldecode(file("${path.module}/../models/data_intersight_cloud_tfc_workspace.yml"))["data_intersight_cloud_tfc_workspace"] }

data "intersight_cloud_tfc_workspace" "n227" {
  account_moid = try(local.m227["account_moid"], null)
  additional_properties = try(local.m227["additional_properties"], null)
  agent_pool_id = try(local.m227["agent_pool_id"], null)
  apply_method = try(local.m227["apply_method"], null)
  class_id = try(local.m227["class_id"], null)
  create_time = try(local.m227["create_time"], null)
  domain_group_moid = try(local.m227["domain_group_moid"], null)
  execution_mode = try(local.m227["execution_mode"], null)
  id = try(local.m227["id"], null)
  identity = try(local.m227["identity"], null)
  last_run_status = try(local.m227["last_run_status"], null)
  mod_time = try(local.m227["mod_time"], null)
  moid = try(local.m227["moid"], null)
  name = try(local.m227["name"], null)
  object_type = try(local.m227["object_type"], null)
  owners = try(local.m227["owners"], null)
  results = try(local.m227["results"], null)
  shared_scope = try(local.m227["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m227["ancestors"], null) == null ? [] : local.m227["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m227["organization"], null) == null ? [] : local.m227["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m227["parent"], null) == null ? [] : local.m227["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m227["permission_resources"], null) == null ? [] : local.m227["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m227["tags"], null) == null ? [] : local.m227["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m227["version_context"], null) == null ? [] : local.m227["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workspace_variables" {
    for_each = try(local.m227["workspace_variables"], null) == null ? [] : local.m227["workspace_variables"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
