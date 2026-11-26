# Sample data source intersight_hcl_exempted_catalog — reads ../models/data_intersight_hcl_exempted_catalog.yml
locals { m545 = yamldecode(file("${path.module}/../models/data_intersight_hcl_exempted_catalog.yml"))["data_intersight_hcl_exempted_catalog"] }

data "intersight_hcl_exempted_catalog" "n545" {
  account_moid = try(local.m545["account_moid"], null)
  additional_properties = try(local.m545["additional_properties"], null)
  class_id = try(local.m545["class_id"], null)
  comments = try(local.m545["comments"], null)
  create_time = try(local.m545["create_time"], null)
  domain_group_moid = try(local.m545["domain_group_moid"], null)
  id = try(local.m545["id"], null)
  mod_time = try(local.m545["mod_time"], null)
  moid = try(local.m545["moid"], null)
  name = try(local.m545["name"], null)
  object_type = try(local.m545["object_type"], null)
  os_vendor = try(local.m545["os_vendor"], null)
  os_version = try(local.m545["os_version"], null)
  owners = try(local.m545["owners"], null)
  personality = try(local.m545["personality"], null)
  processor_name = try(local.m545["processor_name"], null)
  product_models = try(local.m545["product_models"], null)
  product_type = try(local.m545["product_type"], null)
  results = try(local.m545["results"], null)
  server_pid = try(local.m545["server_pid"], null)
  shared_scope = try(local.m545["shared_scope"], null)
  ucs_version = try(local.m545["ucs_version"], null)
  version_type = try(local.m545["version_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m545["ancestors"], null) == null ? [] : local.m545["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m545["parent"], null) == null ? [] : local.m545["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m545["permission_resources"], null) == null ? [] : local.m545["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m545["tags"], null) == null ? [] : local.m545["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m545["version_context"], null) == null ? [] : local.m545["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
