# Sample data source intersight_dnac_site_ip_pool — reads ../models/data_intersight_dnac_site_ip_pool.yml
locals { m294 = yamldecode(file("${path.module}/../models/data_intersight_dnac_site_ip_pool.yml"))["data_intersight_dnac_site_ip_pool"] }

data "intersight_dnac_site_ip_pool" "n294" {
  account_moid = try(local.m294["account_moid"], null)
  additional_properties = try(local.m294["additional_properties"], null)
  class_id = try(local.m294["class_id"], null)
  create_time = try(local.m294["create_time"], null)
  domain_group_moid = try(local.m294["domain_group_moid"], null)
  id = try(local.m294["id"], null)
  ip_pool_cidr = try(local.m294["ip_pool_cidr"], null)
  ip_pool_id = try(local.m294["ip_pool_id"], null)
  ip_pool_name = try(local.m294["ip_pool_name"], null)
  mod_time = try(local.m294["mod_time"], null)
  moid = try(local.m294["moid"], null)
  object_type = try(local.m294["object_type"], null)
  owners = try(local.m294["owners"], null)
  results = try(local.m294["results"], null)
  shared_scope = try(local.m294["shared_scope"], null)
  site_id = try(local.m294["site_id"], null)
  site_name_hierarchy = try(local.m294["site_name_hierarchy"], null)
  dynamic "ancestors" {
    for_each = try(local.m294["ancestors"], null) == null ? [] : local.m294["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m294["parent"], null) == null ? [] : local.m294["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m294["permission_resources"], null) == null ? [] : local.m294["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m294["registered_device"], null) == null ? [] : local.m294["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m294["tags"], null) == null ? [] : local.m294["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m294["version_context"], null) == null ? [] : local.m294["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
