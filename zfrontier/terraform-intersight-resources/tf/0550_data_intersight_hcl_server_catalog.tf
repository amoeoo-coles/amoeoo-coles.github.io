# Sample data source intersight_hcl_server_catalog — reads ../models/data_intersight_hcl_server_catalog.yml
locals { m550 = yamldecode(file("${path.module}/../models/data_intersight_hcl_server_catalog.yml"))["data_intersight_hcl_server_catalog"] }

data "intersight_hcl_server_catalog" "n550" {
  account_moid = try(local.m550["account_moid"], null)
  additional_properties = try(local.m550["additional_properties"], null)
  class_id = try(local.m550["class_id"], null)
  create_time = try(local.m550["create_time"], null)
  domain_group_moid = try(local.m550["domain_group_moid"], null)
  id = try(local.m550["id"], null)
  mod_time = try(local.m550["mod_time"], null)
  moid = try(local.m550["moid"], null)
  object_type = try(local.m550["object_type"], null)
  owners = try(local.m550["owners"], null)
  processor_family = try(local.m550["processor_family"], null)
  results = try(local.m550["results"], null)
  server_pid = try(local.m550["server_pid"], null)
  shared_scope = try(local.m550["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m550["ancestors"], null) == null ? [] : local.m550["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m550["parent"], null) == null ? [] : local.m550["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m550["permission_resources"], null) == null ? [] : local.m550["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m550["tags"], null) == null ? [] : local.m550["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m550["version_context"], null) == null ? [] : local.m550["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
