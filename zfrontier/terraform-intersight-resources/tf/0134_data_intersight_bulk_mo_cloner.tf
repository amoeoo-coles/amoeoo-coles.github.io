# Sample data source intersight_bulk_mo_cloner — reads ../models/data_intersight_bulk_mo_cloner.yml
locals { m134 = yamldecode(file("${path.module}/../models/data_intersight_bulk_mo_cloner.yml"))["data_intersight_bulk_mo_cloner"] }

data "intersight_bulk_mo_cloner" "n134" {
  account_moid = try(local.m134["account_moid"], null)
  additional_properties = try(local.m134["additional_properties"], null)
  class_id = try(local.m134["class_id"], null)
  create_time = try(local.m134["create_time"], null)
  domain_group_moid = try(local.m134["domain_group_moid"], null)
  exclude_properties = try(local.m134["exclude_properties"], null)
  id = try(local.m134["id"], null)
  mod_time = try(local.m134["mod_time"], null)
  moid = try(local.m134["moid"], null)
  object_type = try(local.m134["object_type"], null)
  owners = try(local.m134["owners"], null)
  results = try(local.m134["results"], null)
  shared_scope = try(local.m134["shared_scope"], null)
  workflow_name_suffix = try(local.m134["workflow_name_suffix"], null)
  dynamic "ancestors" {
    for_each = try(local.m134["ancestors"], null) == null ? [] : local.m134["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "async_result" {
    for_each = try(local.m134["async_result"], null) == null ? [] : local.m134["async_result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m134["organization"], null) == null ? [] : local.m134["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m134["parent"], null) == null ? [] : local.m134["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m134["permission_resources"], null) == null ? [] : local.m134["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "responses" {
    for_each = try(local.m134["responses"], null) == null ? [] : local.m134["responses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sources" {
    for_each = try(local.m134["sources"], null) == null ? [] : local.m134["sources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m134["tags"], null) == null ? [] : local.m134["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "targets" {
    for_each = try(local.m134["targets"], null) == null ? [] : local.m134["targets"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m134["version_context"], null) == null ? [] : local.m134["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
