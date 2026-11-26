# Sample data source intersight_memory_persistent_memory_policy — reads ../models/data_intersight_memory_persistent_memory_policy.yml
locals { m828 = yamldecode(file("${path.module}/../models/data_intersight_memory_persistent_memory_policy.yml"))["data_intersight_memory_persistent_memory_policy"] }

data "intersight_memory_persistent_memory_policy" "n828" {
  account_moid = try(local.m828["account_moid"], null)
  additional_properties = try(local.m828["additional_properties"], null)
  class_id = try(local.m828["class_id"], null)
  create_time = try(local.m828["create_time"], null)
  description = try(local.m828["description"], null)
  domain_group_moid = try(local.m828["domain_group_moid"], null)
  id = try(local.m828["id"], null)
  management_mode = try(local.m828["management_mode"], null)
  mod_time = try(local.m828["mod_time"], null)
  moid = try(local.m828["moid"], null)
  name = try(local.m828["name"], null)
  object_type = try(local.m828["object_type"], null)
  owners = try(local.m828["owners"], null)
  results = try(local.m828["results"], null)
  retain_namespaces = try(local.m828["retain_namespaces"], null)
  shared_scope = try(local.m828["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m828["ancestors"], null) == null ? [] : local.m828["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "goals" {
    for_each = try(local.m828["goals"], null) == null ? [] : local.m828["goals"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "local_security" {
    for_each = try(local.m828["local_security"], null) == null ? [] : local.m828["local_security"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "logical_namespaces" {
    for_each = try(local.m828["logical_namespaces"], null) == null ? [] : local.m828["logical_namespaces"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m828["organization"], null) == null ? [] : local.m828["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m828["parent"], null) == null ? [] : local.m828["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m828["permission_resources"], null) == null ? [] : local.m828["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m828["profiles"], null) == null ? [] : local.m828["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m828["tags"], null) == null ? [] : local.m828["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m828["version_context"], null) == null ? [] : local.m828["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
