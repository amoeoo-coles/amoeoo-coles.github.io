# Sample data source intersight_memory_policy — reads ../models/data_intersight_memory_policy.yml
locals { m831 = yamldecode(file("${path.module}/../models/data_intersight_memory_policy.yml"))["data_intersight_memory_policy"] }

data "intersight_memory_policy" "n831" {
  account_moid = try(local.m831["account_moid"], null)
  additional_properties = try(local.m831["additional_properties"], null)
  class_id = try(local.m831["class_id"], null)
  create_time = try(local.m831["create_time"], null)
  description = try(local.m831["description"], null)
  domain_group_moid = try(local.m831["domain_group_moid"], null)
  enable_dimm_blocklisting = try(local.m831["enable_dimm_blocklisting"], null)
  id = try(local.m831["id"], null)
  mod_time = try(local.m831["mod_time"], null)
  moid = try(local.m831["moid"], null)
  name = try(local.m831["name"], null)
  object_type = try(local.m831["object_type"], null)
  owners = try(local.m831["owners"], null)
  results = try(local.m831["results"], null)
  shared_scope = try(local.m831["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m831["ancestors"], null) == null ? [] : local.m831["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m831["organization"], null) == null ? [] : local.m831["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m831["parent"], null) == null ? [] : local.m831["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m831["permission_resources"], null) == null ? [] : local.m831["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m831["profiles"], null) == null ? [] : local.m831["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m831["tags"], null) == null ? [] : local.m831["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m831["version_context"], null) == null ? [] : local.m831["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
