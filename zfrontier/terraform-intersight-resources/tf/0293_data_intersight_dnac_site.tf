# Sample data source intersight_dnac_site — reads ../models/data_intersight_dnac_site.yml
locals { m293 = yamldecode(file("${path.module}/../models/data_intersight_dnac_site.yml"))["data_intersight_dnac_site"] }

data "intersight_dnac_site" "n293" {
  account_moid = try(local.m293["account_moid"], null)
  additional_properties = try(local.m293["additional_properties"], null)
  class_id = try(local.m293["class_id"], null)
  create_time = try(local.m293["create_time"], null)
  domain_group_moid = try(local.m293["domain_group_moid"], null)
  fabric_site_name_hierarchy = try(local.m293["fabric_site_name_hierarchy"], null)
  id = try(local.m293["id"], null)
  mod_time = try(local.m293["mod_time"], null)
  moid = try(local.m293["moid"], null)
  object_type = try(local.m293["object_type"], null)
  owners = try(local.m293["owners"], null)
  results = try(local.m293["results"], null)
  shared_scope = try(local.m293["shared_scope"], null)
  site_id = try(local.m293["site_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m293["ancestors"], null) == null ? [] : local.m293["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m293["parent"], null) == null ? [] : local.m293["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m293["permission_resources"], null) == null ? [] : local.m293["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m293["registered_device"], null) == null ? [] : local.m293["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m293["tags"], null) == null ? [] : local.m293["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m293["version_context"], null) == null ? [] : local.m293["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
