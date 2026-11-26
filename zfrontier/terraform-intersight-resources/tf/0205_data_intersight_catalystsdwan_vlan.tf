# Sample data source intersight_catalystsdwan_vlan — reads ../models/data_intersight_catalystsdwan_vlan.yml
locals { m205 = yamldecode(file("${path.module}/../models/data_intersight_catalystsdwan_vlan.yml"))["data_intersight_catalystsdwan_vlan"] }

data "intersight_catalystsdwan_vlan" "n205" {
  account_moid = try(local.m205["account_moid"], null)
  additional_properties = try(local.m205["additional_properties"], null)
  admin_state = try(local.m205["admin_state"], null)
  class_id = try(local.m205["class_id"], null)
  create_time = try(local.m205["create_time"], null)
  dn = try(local.m205["dn"], null)
  domain_group_moid = try(local.m205["domain_group_moid"], null)
  id = try(local.m205["id"], null)
  local_system_ip = try(local.m205["local_system_ip"], null)
  mod_time = try(local.m205["mod_time"], null)
  moid = try(local.m205["moid"], null)
  object_type = try(local.m205["object_type"], null)
  owners = try(local.m205["owners"], null)
  results = try(local.m205["results"], null)
  shared_scope = try(local.m205["shared_scope"], null)
  system_ip = try(local.m205["system_ip"], null)
  uuid = try(local.m205["uuid"], null)
  vlan_id = try(local.m205["vlan_id"], null)
  vlan_state = try(local.m205["vlan_state"], null)
  dynamic "ancestors" {
    for_each = try(local.m205["ancestors"], null) == null ? [] : local.m205["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m205["parent"], null) == null ? [] : local.m205["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m205["permission_resources"], null) == null ? [] : local.m205["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m205["registered_device"], null) == null ? [] : local.m205["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m205["tags"], null) == null ? [] : local.m205["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m205["version_context"], null) == null ? [] : local.m205["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "wan_edge_device" {
    for_each = try(local.m205["wan_edge_device"], null) == null ? [] : local.m205["wan_edge_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
