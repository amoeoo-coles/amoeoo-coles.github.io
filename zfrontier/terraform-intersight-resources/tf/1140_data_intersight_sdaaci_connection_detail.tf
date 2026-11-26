# Sample data source intersight_sdaaci_connection_detail — reads ../models/data_intersight_sdaaci_connection_detail.yml
locals { m1140 = yamldecode(file("${path.module}/../models/data_intersight_sdaaci_connection_detail.yml"))["data_intersight_sdaaci_connection_detail"] }

data "intersight_sdaaci_connection_detail" "n1140" {
  account_moid = try(local.m1140["account_moid"], null)
  additional_properties = try(local.m1140["additional_properties"], null)
  class_id = try(local.m1140["class_id"], null)
  create_time = try(local.m1140["create_time"], null)
  description = try(local.m1140["description"], null)
  domain_group_moid = try(local.m1140["domain_group_moid"], null)
  id = try(local.m1140["id"], null)
  ip_pool = try(local.m1140["ip_pool"], null)
  layer3_handoff_id = try(local.m1140["layer3_handoff_id"], null)
  mod_time = try(local.m1140["mod_time"], null)
  moid = try(local.m1140["moid"], null)
  object_type = try(local.m1140["object_type"], null)
  owners = try(local.m1140["owners"], null)
  peer_ainterface = try(local.m1140["peer_ainterface"], null)
  peer_aip_address = try(local.m1140["peer_aip_address"], null)
  peer_atype = try(local.m1140["peer_atype"], null)
  peer_binterface = try(local.m1140["peer_binterface"], null)
  peer_bip_address = try(local.m1140["peer_bip_address"], null)
  peer_btype = try(local.m1140["peer_btype"], null)
  peera = try(local.m1140["peera"], null)
  peerb = try(local.m1140["peerb"], null)
  results = try(local.m1140["results"], null)
  router_id = try(local.m1140["router_id"], null)
  shared_scope = try(local.m1140["shared_scope"], null)
  status = try(local.m1140["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m1140["ancestors"], null) == null ? [] : local.m1140["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_connection" {
    for_each = try(local.m1140["nr_connection"], null) == null ? [] : local.m1140["nr_connection"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1140["parent"], null) == null ? [] : local.m1140["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1140["permission_resources"], null) == null ? [] : local.m1140["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1140["tags"], null) == null ? [] : local.m1140["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1140["version_context"], null) == null ? [] : local.m1140["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
