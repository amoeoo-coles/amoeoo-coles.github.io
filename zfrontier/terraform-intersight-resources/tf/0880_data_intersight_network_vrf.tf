# Sample data source intersight_network_vrf — reads ../models/data_intersight_network_vrf.yml
locals { m880 = yamldecode(file("${path.module}/../models/data_intersight_network_vrf.yml"))["data_intersight_network_vrf"] }

data "intersight_network_vrf" "n880" {
  account_moid = try(local.m880["account_moid"], null)
  additional_properties = try(local.m880["additional_properties"], null)
  admin_state = try(local.m880["admin_state"], null)
  class_id = try(local.m880["class_id"], null)
  create_time = try(local.m880["create_time"], null)
  device_mo_id = try(local.m880["device_mo_id"], null)
  dn = try(local.m880["dn"], null)
  domain_group_moid = try(local.m880["domain_group_moid"], null)
  id = try(local.m880["id"], null)
  mod_time = try(local.m880["mod_time"], null)
  moid = try(local.m880["moid"], null)
  name = try(local.m880["name"], null)
  object_type = try(local.m880["object_type"], null)
  owners = try(local.m880["owners"], null)
  results = try(local.m880["results"], null)
  rn = try(local.m880["rn"], null)
  shared_scope = try(local.m880["shared_scope"], null)
  vrf_id = try(local.m880["vrf_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m880["ancestors"], null) == null ? [] : local.m880["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m880["network_element"], null) == null ? [] : local.m880["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m880["parent"], null) == null ? [] : local.m880["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m880["permission_resources"], null) == null ? [] : local.m880["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m880["registered_device"], null) == null ? [] : local.m880["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m880["tags"], null) == null ? [] : local.m880["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m880["version_context"], null) == null ? [] : local.m880["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
