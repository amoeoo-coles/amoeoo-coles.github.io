# Sample data source intersight_network_dns — reads ../models/data_intersight_network_dns.yml
locals { m862 = yamldecode(file("${path.module}/../models/data_intersight_network_dns.yml"))["data_intersight_network_dns"] }

data "intersight_network_dns" "n862" {
  account_moid = try(local.m862["account_moid"], null)
  additional_domains = try(local.m862["additional_domains"], null)
  additional_properties = try(local.m862["additional_properties"], null)
  class_id = try(local.m862["class_id"], null)
  create_time = try(local.m862["create_time"], null)
  default_domain = try(local.m862["default_domain"], null)
  device_mo_id = try(local.m862["device_mo_id"], null)
  dn = try(local.m862["dn"], null)
  domain_group_moid = try(local.m862["domain_group_moid"], null)
  id = try(local.m862["id"], null)
  mod_time = try(local.m862["mod_time"], null)
  moid = try(local.m862["moid"], null)
  name_servers = try(local.m862["name_servers"], null)
  object_type = try(local.m862["object_type"], null)
  owners = try(local.m862["owners"], null)
  results = try(local.m862["results"], null)
  rn = try(local.m862["rn"], null)
  shared_scope = try(local.m862["shared_scope"], null)
  vrf_name = try(local.m862["vrf_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m862["ancestors"], null) == null ? [] : local.m862["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m862["network_element"], null) == null ? [] : local.m862["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m862["parent"], null) == null ? [] : local.m862["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m862["permission_resources"], null) == null ? [] : local.m862["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m862["registered_device"], null) == null ? [] : local.m862["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m862["tags"], null) == null ? [] : local.m862["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m862["version_context"], null) == null ? [] : local.m862["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
