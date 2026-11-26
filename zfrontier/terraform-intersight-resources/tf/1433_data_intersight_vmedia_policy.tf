# Sample data source intersight_vmedia_policy — reads ../models/data_intersight_vmedia_policy.yml
locals { m1433 = yamldecode(file("${path.module}/../models/data_intersight_vmedia_policy.yml"))["data_intersight_vmedia_policy"] }

data "intersight_vmedia_policy" "n1433" {
  account_moid = try(local.m1433["account_moid"], null)
  additional_properties = try(local.m1433["additional_properties"], null)
  class_id = try(local.m1433["class_id"], null)
  create_time = try(local.m1433["create_time"], null)
  description = try(local.m1433["description"], null)
  domain_group_moid = try(local.m1433["domain_group_moid"], null)
  enabled = try(local.m1433["enabled"], null)
  encryption = try(local.m1433["encryption"], null)
  id = try(local.m1433["id"], null)
  low_power_usb = try(local.m1433["low_power_usb"], null)
  mod_time = try(local.m1433["mod_time"], null)
  moid = try(local.m1433["moid"], null)
  name = try(local.m1433["name"], null)
  object_type = try(local.m1433["object_type"], null)
  owners = try(local.m1433["owners"], null)
  results = try(local.m1433["results"], null)
  shared_scope = try(local.m1433["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1433["ancestors"], null) == null ? [] : local.m1433["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mappings" {
    for_each = try(local.m1433["mappings"], null) == null ? [] : local.m1433["mappings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1433["organization"], null) == null ? [] : local.m1433["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1433["parent"], null) == null ? [] : local.m1433["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1433["permission_resources"], null) == null ? [] : local.m1433["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m1433["profiles"], null) == null ? [] : local.m1433["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1433["tags"], null) == null ? [] : local.m1433["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1433["version_context"], null) == null ? [] : local.m1433["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
