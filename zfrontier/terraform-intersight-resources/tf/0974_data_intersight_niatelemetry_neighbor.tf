# Sample data source intersight_niatelemetry_neighbor — reads ../models/data_intersight_niatelemetry_neighbor.yml
locals { m974 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_neighbor.yml"))["data_intersight_niatelemetry_neighbor"] }

data "intersight_niatelemetry_neighbor" "n974" {
  account_moid = try(local.m974["account_moid"], null)
  additional_properties = try(local.m974["additional_properties"], null)
  asn = try(local.m974["asn"], null)
  class_id = try(local.m974["class_id"], null)
  create_time = try(local.m974["create_time"], null)
  domain_group_moid = try(local.m974["domain_group_moid"], null)
  fabric_name = try(local.m974["fabric_name"], null)
  id = try(local.m974["id"], null)
  interface_ip = try(local.m974["interface_ip"], null)
  local_ip = try(local.m974["local_ip"], null)
  mod_time = try(local.m974["mod_time"], null)
  moid = try(local.m974["moid"], null)
  object_type = try(local.m974["object_type"], null)
  operational_status = try(local.m974["operational_status"], null)
  ospf_area = try(local.m974["ospf_area"], null)
  owners = try(local.m974["owners"], null)
  peer_asn = try(local.m974["peer_asn"], null)
  peer_ip = try(local.m974["peer_ip"], null)
  results = try(local.m974["results"], null)
  shared_scope = try(local.m974["shared_scope"], null)
  switch_name = try(local.m974["switch_name"], null)
  type = try(local.m974["type"], null)
  vrf_name = try(local.m974["vrf_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m974["ancestors"], null) == null ? [] : local.m974["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fabric" {
    for_each = try(local.m974["fabric"], null) == null ? [] : local.m974["fabric"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m974["parent"], null) == null ? [] : local.m974["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m974["permission_resources"], null) == null ? [] : local.m974["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m974["tags"], null) == null ? [] : local.m974["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m974["version_context"], null) == null ? [] : local.m974["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
