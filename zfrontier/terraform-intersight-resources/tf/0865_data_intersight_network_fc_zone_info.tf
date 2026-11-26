# Sample data source intersight_network_fc_zone_info — reads ../models/data_intersight_network_fc_zone_info.yml
locals { m865 = yamldecode(file("${path.module}/../models/data_intersight_network_fc_zone_info.yml"))["data_intersight_network_fc_zone_info"] }

data "intersight_network_fc_zone_info" "n865" {
  account_moid = try(local.m865["account_moid"], null)
  additional_properties = try(local.m865["additional_properties"], null)
  class_id = try(local.m865["class_id"], null)
  create_time = try(local.m865["create_time"], null)
  device_mo_id = try(local.m865["device_mo_id"], null)
  dn = try(local.m865["dn"], null)
  domain_group_moid = try(local.m865["domain_group_moid"], null)
  id = try(local.m865["id"], null)
  mod_time = try(local.m865["mod_time"], null)
  moid = try(local.m865["moid"], null)
  object_type = try(local.m865["object_type"], null)
  owners = try(local.m865["owners"], null)
  results = try(local.m865["results"], null)
  rn = try(local.m865["rn"], null)
  shared_scope = try(local.m865["shared_scope"], null)
  user_zone_count = try(local.m865["user_zone_count"], null)
  user_zone_limit = try(local.m865["user_zone_limit"], null)
  zone_count = try(local.m865["zone_count"], null)
  zone_limit = try(local.m865["zone_limit"], null)
  dynamic "ancestors" {
    for_each = try(local.m865["ancestors"], null) == null ? [] : local.m865["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m865["inventory_device_info"], null) == null ? [] : local.m865["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m865["network_element"], null) == null ? [] : local.m865["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m865["parent"], null) == null ? [] : local.m865["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m865["permission_resources"], null) == null ? [] : local.m865["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m865["registered_device"], null) == null ? [] : local.m865["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m865["tags"], null) == null ? [] : local.m865["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m865["version_context"], null) == null ? [] : local.m865["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
