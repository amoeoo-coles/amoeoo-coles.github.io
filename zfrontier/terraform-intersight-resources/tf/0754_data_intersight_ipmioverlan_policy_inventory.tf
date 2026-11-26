# Sample data source intersight_ipmioverlan_policy_inventory — reads ../models/data_intersight_ipmioverlan_policy_inventory.yml
locals { m754 = yamldecode(file("${path.module}/../models/data_intersight_ipmioverlan_policy_inventory.yml"))["data_intersight_ipmioverlan_policy_inventory"] }

data "intersight_ipmioverlan_policy_inventory" "n754" {
  account_moid = try(local.m754["account_moid"], null)
  additional_properties = try(local.m754["additional_properties"], null)
  class_id = try(local.m754["class_id"], null)
  create_time = try(local.m754["create_time"], null)
  description = try(local.m754["description"], null)
  device_mo_id = try(local.m754["device_mo_id"], null)
  domain_group_moid = try(local.m754["domain_group_moid"], null)
  enabled = try(local.m754["enabled"], null)
  encryption_key = try(var.secrets["data_intersight_ipmioverlan_policy_inventory.encryption_key"], local.m754["encryption_key"])
  id = try(local.m754["id"], null)
  is_encryption_key_set = try(var.secrets["data_intersight_ipmioverlan_policy_inventory.is_encryption_key_set"], local.m754["is_encryption_key_set"])
  mod_time = try(local.m754["mod_time"], null)
  moid = try(local.m754["moid"], null)
  name = try(local.m754["name"], null)
  object_type = try(local.m754["object_type"], null)
  owners = try(local.m754["owners"], null)
  privilege = try(local.m754["privilege"], null)
  results = try(local.m754["results"], null)
  shared_scope = try(local.m754["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m754["ancestors"], null) == null ? [] : local.m754["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m754["parent"], null) == null ? [] : local.m754["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m754["permission_resources"], null) == null ? [] : local.m754["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m754["tags"], null) == null ? [] : local.m754["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m754["target_mo"], null) == null ? [] : local.m754["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m754["version_context"], null) == null ? [] : local.m754["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
