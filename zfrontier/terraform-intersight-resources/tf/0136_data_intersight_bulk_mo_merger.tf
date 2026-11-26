# Sample data source intersight_bulk_mo_merger — reads ../models/data_intersight_bulk_mo_merger.yml
locals { m136 = yamldecode(file("${path.module}/../models/data_intersight_bulk_mo_merger.yml"))["data_intersight_bulk_mo_merger"] }

data "intersight_bulk_mo_merger" "n136" {
  account_moid = try(local.m136["account_moid"], null)
  additional_properties = try(local.m136["additional_properties"], null)
  class_id = try(local.m136["class_id"], null)
  create_time = try(local.m136["create_time"], null)
  domain_group_moid = try(local.m136["domain_group_moid"], null)
  id = try(local.m136["id"], null)
  merge_action = try(local.m136["merge_action"], null)
  mod_time = try(local.m136["mod_time"], null)
  moid = try(local.m136["moid"], null)
  object_type = try(local.m136["object_type"], null)
  owners = try(local.m136["owners"], null)
  results = try(local.m136["results"], null)
  shared_scope = try(local.m136["shared_scope"], null)
  workflow_name_suffix = try(local.m136["workflow_name_suffix"], null)
  dynamic "ancestors" {
    for_each = try(local.m136["ancestors"], null) == null ? [] : local.m136["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "async_result" {
    for_each = try(local.m136["async_result"], null) == null ? [] : local.m136["async_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m136["organization"], null) == null ? [] : local.m136["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m136["parent"], null) == null ? [] : local.m136["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m136["permission_resources"], null) == null ? [] : local.m136["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "responses" {
    for_each = try(local.m136["responses"], null) == null ? [] : local.m136["responses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sources" {
    for_each = try(local.m136["sources"], null) == null ? [] : local.m136["sources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m136["tags"], null) == null ? [] : local.m136["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_config" {
    for_each = try(local.m136["target_config"], null) == null ? [] : local.m136["target_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "targets" {
    for_each = try(local.m136["targets"], null) == null ? [] : local.m136["targets"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m136["version_context"], null) == null ? [] : local.m136["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
