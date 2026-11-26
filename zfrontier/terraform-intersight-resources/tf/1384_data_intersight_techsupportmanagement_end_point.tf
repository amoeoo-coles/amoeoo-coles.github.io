# Sample data source intersight_techsupportmanagement_end_point — reads ../models/data_intersight_techsupportmanagement_end_point.yml
locals { m1384 = yamldecode(file("${path.module}/../models/data_intersight_techsupportmanagement_end_point.yml"))["data_intersight_techsupportmanagement_end_point"] }

data "intersight_techsupportmanagement_end_point" "n1384" {
  account_moid = try(local.m1384["account_moid"], null)
  additional_properties = try(local.m1384["additional_properties"], null)
  class_id = try(local.m1384["class_id"], null)
  create_time = try(local.m1384["create_time"], null)
  device_moid = try(local.m1384["device_moid"], null)
  device_type = try(local.m1384["device_type"], null)
  dn = try(local.m1384["dn"], null)
  domain_group_moid = try(local.m1384["domain_group_moid"], null)
  id = try(local.m1384["id"], null)
  mod_time = try(local.m1384["mod_time"], null)
  moid = try(local.m1384["moid"], null)
  object_type = try(local.m1384["object_type"], null)
  owners = try(local.m1384["owners"], null)
  pid = try(local.m1384["pid"], null)
  platform_type = try(local.m1384["platform_type"], null)
  results = try(local.m1384["results"], null)
  serial = try(local.m1384["serial"], null)
  shared_scope = try(local.m1384["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1384["ancestors"], null) == null ? [] : local.m1384["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_member" {
    for_each = try(local.m1384["cluster_member"], null) == null ? [] : local.m1384["cluster_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_registration" {
    for_each = try(local.m1384["device_registration"], null) == null ? [] : local.m1384["device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1384["parent"], null) == null ? [] : local.m1384["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1384["permission_resources"], null) == null ? [] : local.m1384["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1384["tags"], null) == null ? [] : local.m1384["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_resource" {
    for_each = try(local.m1384["target_resource"], null) == null ? [] : local.m1384["target_resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1384["version_context"], null) == null ? [] : local.m1384["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
