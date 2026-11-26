# Sample data source intersight_vnic_lan_settings — reads ../models/data_intersight_vnic_lan_settings.yml
locals { m1480 = yamldecode(file("${path.module}/../models/data_intersight_vnic_lan_settings.yml"))["data_intersight_vnic_lan_settings"] }

data "intersight_vnic_lan_settings" "n1480" {
  account_moid = try(local.m1480["account_moid"], null)
  additional_properties = try(local.m1480["additional_properties"], null)
  class_id = try(local.m1480["class_id"], null)
  create_time = try(local.m1480["create_time"], null)
  description = try(local.m1480["description"], null)
  domain_group_moid = try(local.m1480["domain_group_moid"], null)
  id = try(local.m1480["id"], null)
  iqn_name = try(local.m1480["iqn_name"], null)
  mod_time = try(local.m1480["mod_time"], null)
  moid = try(local.m1480["moid"], null)
  name = try(local.m1480["name"], null)
  object_type = try(local.m1480["object_type"], null)
  owners = try(local.m1480["owners"], null)
  results = try(local.m1480["results"], null)
  shared_scope = try(local.m1480["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1480["ancestors"], null) == null ? [] : local.m1480["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iqn_lease" {
    for_each = try(local.m1480["iqn_lease"], null) == null ? [] : local.m1480["iqn_lease"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1480["parent"], null) == null ? [] : local.m1480["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1480["permission_resources"], null) == null ? [] : local.m1480["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m1480["profile"], null) == null ? [] : local.m1480["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1480["tags"], null) == null ? [] : local.m1480["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1480["version_context"], null) == null ? [] : local.m1480["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
