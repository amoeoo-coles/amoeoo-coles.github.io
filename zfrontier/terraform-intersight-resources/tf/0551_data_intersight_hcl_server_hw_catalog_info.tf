# Sample data source intersight_hcl_server_hw_catalog_info — reads ../models/data_intersight_hcl_server_hw_catalog_info.yml
locals { m551 = yamldecode(file("${path.module}/../models/data_intersight_hcl_server_hw_catalog_info.yml"))["data_intersight_hcl_server_hw_catalog_info"] }

data "intersight_hcl_server_hw_catalog_info" "n551" {
  account_moid = try(local.m551["account_moid"], null)
  additional_properties = try(local.m551["additional_properties"], null)
  class_id = try(local.m551["class_id"], null)
  create_time = try(local.m551["create_time"], null)
  display_model = try(local.m551["display_model"], null)
  domain_group_moid = try(local.m551["domain_group_moid"], null)
  id = try(local.m551["id"], null)
  mod_time = try(local.m551["mod_time"], null)
  model = try(local.m551["model"], null)
  moid = try(local.m551["moid"], null)
  object_type = try(local.m551["object_type"], null)
  owners = try(local.m551["owners"], null)
  results = try(local.m551["results"], null)
  shared_scope = try(local.m551["shared_scope"], null)
  type = try(local.m551["type"], null)
  value = try(local.m551["value"], null)
  dynamic "ancestors" {
    for_each = try(local.m551["ancestors"], null) == null ? [] : local.m551["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "constraints" {
    for_each = try(local.m551["constraints"], null) == null ? [] : local.m551["constraints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m551["parent"], null) == null ? [] : local.m551["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m551["permission_resources"], null) == null ? [] : local.m551["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_hw_info" {
    for_each = try(local.m551["server_hw_info"], null) == null ? [] : local.m551["server_hw_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m551["tags"], null) == null ? [] : local.m551["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m551["version_context"], null) == null ? [] : local.m551["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
