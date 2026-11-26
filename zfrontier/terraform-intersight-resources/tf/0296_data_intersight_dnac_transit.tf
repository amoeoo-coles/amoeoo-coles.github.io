# Sample data source intersight_dnac_transit — reads ../models/data_intersight_dnac_transit.yml
locals { m296 = yamldecode(file("${path.module}/../models/data_intersight_dnac_transit.yml"))["data_intersight_dnac_transit"] }

data "intersight_dnac_transit" "n296" {
  account_moid = try(local.m296["account_moid"], null)
  additional_properties = try(local.m296["additional_properties"], null)
  class_id = try(local.m296["class_id"], null)
  create_time = try(local.m296["create_time"], null)
  domain_group_moid = try(local.m296["domain_group_moid"], null)
  id = try(local.m296["id"], null)
  mod_time = try(local.m296["mod_time"], null)
  moid = try(local.m296["moid"], null)
  object_type = try(local.m296["object_type"], null)
  owners = try(local.m296["owners"], null)
  results = try(local.m296["results"], null)
  shared_scope = try(local.m296["shared_scope"], null)
  transit_id = try(local.m296["transit_id"], null)
  transit_name = try(local.m296["transit_name"], null)
  transit_type = try(local.m296["transit_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m296["ancestors"], null) == null ? [] : local.m296["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m296["parent"], null) == null ? [] : local.m296["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m296["permission_resources"], null) == null ? [] : local.m296["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m296["registered_device"], null) == null ? [] : local.m296["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m296["tags"], null) == null ? [] : local.m296["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m296["version_context"], null) == null ? [] : local.m296["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
