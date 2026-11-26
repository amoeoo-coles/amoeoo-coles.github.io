# Sample data source intersight_ipmioverlan_policy — reads ../models/data_intersight_ipmioverlan_policy.yml
locals { m753 = yamldecode(file("${path.module}/../models/data_intersight_ipmioverlan_policy.yml"))["data_intersight_ipmioverlan_policy"] }

data "intersight_ipmioverlan_policy" "n753" {
  account_moid = try(local.m753["account_moid"], null)
  additional_properties = try(local.m753["additional_properties"], null)
  class_id = try(local.m753["class_id"], null)
  create_time = try(local.m753["create_time"], null)
  description = try(local.m753["description"], null)
  domain_group_moid = try(local.m753["domain_group_moid"], null)
  enabled = try(local.m753["enabled"], null)
  encryption_key = try(var.secrets["data_intersight_ipmioverlan_policy.encryption_key"], local.m753["encryption_key"])
  id = try(local.m753["id"], null)
  is_encryption_key_set = try(var.secrets["data_intersight_ipmioverlan_policy.is_encryption_key_set"], local.m753["is_encryption_key_set"])
  mod_time = try(local.m753["mod_time"], null)
  moid = try(local.m753["moid"], null)
  name = try(local.m753["name"], null)
  object_type = try(local.m753["object_type"], null)
  owners = try(local.m753["owners"], null)
  privilege = try(local.m753["privilege"], null)
  results = try(local.m753["results"], null)
  shared_scope = try(local.m753["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m753["ancestors"], null) == null ? [] : local.m753["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m753["organization"], null) == null ? [] : local.m753["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m753["parent"], null) == null ? [] : local.m753["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m753["permission_resources"], null) == null ? [] : local.m753["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m753["profiles"], null) == null ? [] : local.m753["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m753["tags"], null) == null ? [] : local.m753["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m753["version_context"], null) == null ? [] : local.m753["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
