# Sample data source intersight_dnac_fabric_site — reads ../models/data_intersight_dnac_fabric_site.yml
locals { m292 = yamldecode(file("${path.module}/../models/data_intersight_dnac_fabric_site.yml"))["data_intersight_dnac_fabric_site"] }

data "intersight_dnac_fabric_site" "n292" {
  account_moid = try(local.m292["account_moid"], null)
  additional_properties = try(local.m292["additional_properties"], null)
  authentication_profile_name = try(local.m292["authentication_profile_name"], null)
  class_id = try(local.m292["class_id"], null)
  create_time = try(local.m292["create_time"], null)
  domain_group_moid = try(local.m292["domain_group_moid"], null)
  fabric_site_id = try(local.m292["fabric_site_id"], null)
  fabric_site_name_hierarchy = try(local.m292["fabric_site_name_hierarchy"], null)
  id = try(local.m292["id"], null)
  is_pub_sub_enabled = try(local.m292["is_pub_sub_enabled"], null)
  mod_time = try(local.m292["mod_time"], null)
  moid = try(local.m292["moid"], null)
  object_type = try(local.m292["object_type"], null)
  owners = try(local.m292["owners"], null)
  results = try(local.m292["results"], null)
  shared_scope = try(local.m292["shared_scope"], null)
  site_id = try(local.m292["site_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m292["ancestors"], null) == null ? [] : local.m292["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m292["parent"], null) == null ? [] : local.m292["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m292["permission_resources"], null) == null ? [] : local.m292["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m292["registered_device"], null) == null ? [] : local.m292["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m292["tags"], null) == null ? [] : local.m292["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m292["version_context"], null) == null ? [] : local.m292["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
