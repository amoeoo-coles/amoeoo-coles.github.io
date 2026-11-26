# Sample data source intersight_certificatemanagement_policy_inventory — reads ../models/data_intersight_certificatemanagement_policy_inventory.yml
locals { m211 = yamldecode(file("${path.module}/../models/data_intersight_certificatemanagement_policy_inventory.yml"))["data_intersight_certificatemanagement_policy_inventory"] }

data "intersight_certificatemanagement_policy_inventory" "n211" {
  account_moid = try(local.m211["account_moid"], null)
  additional_properties = try(local.m211["additional_properties"], null)
  class_id = try(local.m211["class_id"], null)
  create_time = try(local.m211["create_time"], null)
  description = try(local.m211["description"], null)
  device_mo_id = try(local.m211["device_mo_id"], null)
  domain_group_moid = try(local.m211["domain_group_moid"], null)
  id = try(local.m211["id"], null)
  mod_time = try(local.m211["mod_time"], null)
  moid = try(local.m211["moid"], null)
  name = try(local.m211["name"], null)
  object_type = try(local.m211["object_type"], null)
  owners = try(local.m211["owners"], null)
  results = try(local.m211["results"], null)
  shared_scope = try(local.m211["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m211["ancestors"], null) == null ? [] : local.m211["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "certificates" {
    for_each = try(local.m211["certificates"], null) == null ? [] : local.m211["certificates"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m211["parent"], null) == null ? [] : local.m211["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m211["permission_resources"], null) == null ? [] : local.m211["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m211["tags"], null) == null ? [] : local.m211["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m211["target_mo"], null) == null ? [] : local.m211["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m211["version_context"], null) == null ? [] : local.m211["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
