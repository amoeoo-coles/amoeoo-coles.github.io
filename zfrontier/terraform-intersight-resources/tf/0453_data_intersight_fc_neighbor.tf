# Sample data source intersight_fc_neighbor — reads ../models/data_intersight_fc_neighbor.yml
locals { m453 = yamldecode(file("${path.module}/../models/data_intersight_fc_neighbor.yml"))["data_intersight_fc_neighbor"] }

data "intersight_fc_neighbor" "n453" {
  account_moid = try(local.m453["account_moid"], null)
  additional_properties = try(local.m453["additional_properties"], null)
  class_id = try(local.m453["class_id"], null)
  create_time = try(local.m453["create_time"], null)
  device_mo_id = try(local.m453["device_mo_id"], null)
  dn = try(local.m453["dn"], null)
  domain_group_moid = try(local.m453["domain_group_moid"], null)
  id = try(local.m453["id"], null)
  mod_time = try(local.m453["mod_time"], null)
  moid = try(local.m453["moid"], null)
  object_type = try(local.m453["object_type"], null)
  owners = try(local.m453["owners"], null)
  peer_device_capability = try(local.m453["peer_device_capability"], null)
  peer_interface = try(local.m453["peer_interface"], null)
  peer_ip_address = try(local.m453["peer_ip_address"], null)
  peer_port_wwn = try(local.m453["peer_port_wwn"], null)
  peer_switch_name = try(local.m453["peer_switch_name"], null)
  peer_wwn = try(local.m453["peer_wwn"], null)
  results = try(local.m453["results"], null)
  rn = try(local.m453["rn"], null)
  shared_scope = try(local.m453["shared_scope"], null)
  vendor = try(local.m453["vendor"], null)
  vsan = try(local.m453["vsan"], null)
  dynamic "ancestors" {
    for_each = try(local.m453["ancestors"], null) == null ? [] : local.m453["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_physical_port" {
    for_each = try(local.m453["fc_physical_port"], null) == null ? [] : local.m453["fc_physical_port"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_port_channel" {
    for_each = try(local.m453["fc_port_channel"], null) == null ? [] : local.m453["fc_port_channel"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m453["parent"], null) == null ? [] : local.m453["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m453["permission_resources"], null) == null ? [] : local.m453["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m453["tags"], null) == null ? [] : local.m453["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m453["version_context"], null) == null ? [] : local.m453["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
