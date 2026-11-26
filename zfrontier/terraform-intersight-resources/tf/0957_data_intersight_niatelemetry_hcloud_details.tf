# Sample data source intersight_niatelemetry_hcloud_details — reads ../models/data_intersight_niatelemetry_hcloud_details.yml
locals { m957 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_hcloud_details.yml"))["data_intersight_niatelemetry_hcloud_details"] }

data "intersight_niatelemetry_hcloud_details" "n957" {
  account_moid = try(local.m957["account_moid"], null)
  additional_properties = try(local.m957["additional_properties"], null)
  class_id = try(local.m957["class_id"], null)
  create_time = try(local.m957["create_time"], null)
  dn = try(local.m957["dn"], null)
  domain_group_moid = try(local.m957["domain_group_moid"], null)
  epg_count = try(local.m957["epg_count"], null)
  id = try(local.m957["id"], null)
  mod_time = try(local.m957["mod_time"], null)
  moid = try(local.m957["moid"], null)
  object_type = try(local.m957["object_type"], null)
  owners = try(local.m957["owners"], null)
  record_type = try(local.m957["record_type"], null)
  record_version = try(local.m957["record_version"], null)
  results = try(local.m957["results"], null)
  router_count = try(local.m957["router_count"], null)
  shared_scope = try(local.m957["shared_scope"], null)
  site_name = try(local.m957["site_name"], null)
  subnets_address = try(local.m957["subnets_address"], null)
  subnets_count = try(local.m957["subnets_count"], null)
  transit_gateways_count = try(local.m957["transit_gateways_count"], null)
  vpc_count = try(local.m957["vpc_count"], null)
  vpc_count_gcp = try(local.m957["vpc_count_gcp"], null)
  dynamic "ancestors" {
    for_each = try(local.m957["ancestors"], null) == null ? [] : local.m957["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m957["parent"], null) == null ? [] : local.m957["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m957["permission_resources"], null) == null ? [] : local.m957["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m957["registered_device"], null) == null ? [] : local.m957["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "router" {
    for_each = try(local.m957["router"], null) == null ? [] : local.m957["router"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m957["tags"], null) == null ? [] : local.m957["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m957["version_context"], null) == null ? [] : local.m957["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
