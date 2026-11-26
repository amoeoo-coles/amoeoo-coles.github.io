# Sample data source intersight_ntp_policy_inventory — reads ../models/data_intersight_ntp_policy_inventory.yml
locals { m1010 = yamldecode(file("${path.module}/../models/data_intersight_ntp_policy_inventory.yml"))["data_intersight_ntp_policy_inventory"] }

data "intersight_ntp_policy_inventory" "n1010" {
  account_moid = try(local.m1010["account_moid"], null)
  additional_properties = try(local.m1010["additional_properties"], null)
  class_id = try(local.m1010["class_id"], null)
  create_time = try(local.m1010["create_time"], null)
  description = try(local.m1010["description"], null)
  device_mo_id = try(local.m1010["device_mo_id"], null)
  domain_group_moid = try(local.m1010["domain_group_moid"], null)
  enabled = try(local.m1010["enabled"], null)
  id = try(local.m1010["id"], null)
  mod_time = try(local.m1010["mod_time"], null)
  moid = try(local.m1010["moid"], null)
  name = try(local.m1010["name"], null)
  ntp_servers = try(local.m1010["ntp_servers"], null)
  object_type = try(local.m1010["object_type"], null)
  owners = try(local.m1010["owners"], null)
  results = try(local.m1010["results"], null)
  shared_scope = try(local.m1010["shared_scope"], null)
  timezone = try(local.m1010["timezone"], null)
  dynamic "ancestors" {
    for_each = try(local.m1010["ancestors"], null) == null ? [] : local.m1010["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "authenticated_ntp_servers" {
    for_each = try(local.m1010["authenticated_ntp_servers"], null) == null ? [] : local.m1010["authenticated_ntp_servers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1010["parent"], null) == null ? [] : local.m1010["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1010["permission_resources"], null) == null ? [] : local.m1010["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1010["tags"], null) == null ? [] : local.m1010["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1010["target_mo"], null) == null ? [] : local.m1010["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1010["version_context"], null) == null ? [] : local.m1010["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
