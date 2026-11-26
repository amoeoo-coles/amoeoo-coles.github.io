# Sample data source intersight_dnac_virtual_network_fabric_site — reads ../models/data_intersight_dnac_virtual_network_fabric_site.yml
locals { m297 = yamldecode(file("${path.module}/../models/data_intersight_dnac_virtual_network_fabric_site.yml"))["data_intersight_dnac_virtual_network_fabric_site"] }

data "intersight_dnac_virtual_network_fabric_site" "n297" {
  account_moid = try(local.m297["account_moid"], null)
  additional_properties = try(local.m297["additional_properties"], null)
  class_id = try(local.m297["class_id"], null)
  create_time = try(local.m297["create_time"], null)
  domain_group_moid = try(local.m297["domain_group_moid"], null)
  fabric_site_name_hierarchy = try(local.m297["fabric_site_name_hierarchy"], null)
  id = try(local.m297["id"], null)
  mod_time = try(local.m297["mod_time"], null)
  moid = try(local.m297["moid"], null)
  object_type = try(local.m297["object_type"], null)
  owners = try(local.m297["owners"], null)
  results = try(local.m297["results"], null)
  shared_scope = try(local.m297["shared_scope"], null)
  site_id = try(local.m297["site_id"], null)
  virtual_network_id = try(local.m297["virtual_network_id"], null)
  virtual_network_name = try(local.m297["virtual_network_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m297["ancestors"], null) == null ? [] : local.m297["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m297["parent"], null) == null ? [] : local.m297["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m297["permission_resources"], null) == null ? [] : local.m297["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m297["registered_device"], null) == null ? [] : local.m297["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m297["tags"], null) == null ? [] : local.m297["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m297["version_context"], null) == null ? [] : local.m297["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
