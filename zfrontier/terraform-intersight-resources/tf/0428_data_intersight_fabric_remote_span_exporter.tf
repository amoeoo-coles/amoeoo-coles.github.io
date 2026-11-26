# Sample data source intersight_fabric_remote_span_exporter — reads ../models/data_intersight_fabric_remote_span_exporter.yml
locals { m428 = yamldecode(file("${path.module}/../models/data_intersight_fabric_remote_span_exporter.yml"))["data_intersight_fabric_remote_span_exporter"] }

data "intersight_fabric_remote_span_exporter" "n428" {
  account_moid = try(local.m428["account_moid"], null)
  additional_properties = try(local.m428["additional_properties"], null)
  class_id = try(local.m428["class_id"], null)
  config_state = try(local.m428["config_state"], null)
  create_time = try(local.m428["create_time"], null)
  domain_group_moid = try(local.m428["domain_group_moid"], null)
  gateway = try(local.m428["gateway"], null)
  id = try(local.m428["id"], null)
  ip_address_source = try(local.m428["ip_address_source"], null)
  mod_time = try(local.m428["mod_time"], null)
  moid = try(local.m428["moid"], null)
  object_type = try(local.m428["object_type"], null)
  oper_state = try(local.m428["oper_state"], null)
  oper_state_reason = try(local.m428["oper_state_reason"], null)
  operational_ip_address = try(local.m428["operational_ip_address"], null)
  owners = try(local.m428["owners"], null)
  results = try(local.m428["results"], null)
  shared_scope = try(local.m428["shared_scope"], null)
  source_ip = try(local.m428["source_ip"], null)
  source_netmask = try(local.m428["source_netmask"], null)
  source_vlan_id = try(local.m428["source_vlan_id"], null)
  switch_id = try(local.m428["switch_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m428["ancestors"], null) == null ? [] : local.m428["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m428["network_element"], null) == null ? [] : local.m428["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m428["parent"], null) == null ? [] : local.m428["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m428["permission_resources"], null) == null ? [] : local.m428["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m428["tags"], null) == null ? [] : local.m428["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m428["version_context"], null) == null ? [] : local.m428["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
