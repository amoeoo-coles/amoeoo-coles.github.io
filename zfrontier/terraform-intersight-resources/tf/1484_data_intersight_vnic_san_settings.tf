# Sample data source intersight_vnic_san_settings — reads ../models/data_intersight_vnic_san_settings.yml
locals { m1484 = yamldecode(file("${path.module}/../models/data_intersight_vnic_san_settings.yml"))["data_intersight_vnic_san_settings"] }

data "intersight_vnic_san_settings" "n1484" {
  account_moid = try(local.m1484["account_moid"], null)
  additional_properties = try(local.m1484["additional_properties"], null)
  class_id = try(local.m1484["class_id"], null)
  create_time = try(local.m1484["create_time"], null)
  description = try(local.m1484["description"], null)
  domain_group_moid = try(local.m1484["domain_group_moid"], null)
  id = try(local.m1484["id"], null)
  mod_time = try(local.m1484["mod_time"], null)
  moid = try(local.m1484["moid"], null)
  name = try(local.m1484["name"], null)
  object_type = try(local.m1484["object_type"], null)
  owners = try(local.m1484["owners"], null)
  results = try(local.m1484["results"], null)
  shared_scope = try(local.m1484["shared_scope"], null)
  wwnn = try(local.m1484["wwnn"], null)
  dynamic "ancestors" {
    for_each = try(local.m1484["ancestors"], null) == null ? [] : local.m1484["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "old_info" {
    for_each = try(local.m1484["old_info"], null) == null ? [] : local.m1484["old_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1484["parent"], null) == null ? [] : local.m1484["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1484["permission_resources"], null) == null ? [] : local.m1484["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m1484["profile"], null) == null ? [] : local.m1484["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1484["tags"], null) == null ? [] : local.m1484["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1484["version_context"], null) == null ? [] : local.m1484["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "wwnn_lease" {
    for_each = try(local.m1484["wwnn_lease"], null) == null ? [] : local.m1484["wwnn_lease"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
