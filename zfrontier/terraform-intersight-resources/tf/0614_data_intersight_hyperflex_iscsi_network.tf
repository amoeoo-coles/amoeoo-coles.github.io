# Sample data source intersight_hyperflex_iscsi_network — reads ../models/data_intersight_hyperflex_iscsi_network.yml
locals { m614 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_iscsi_network.yml"))["data_intersight_hyperflex_iscsi_network"] }

data "intersight_hyperflex_iscsi_network" "n614" {
  account_moid = try(local.m614["account_moid"], null)
  additional_properties = try(local.m614["additional_properties"], null)
  class_id = try(local.m614["class_id"], null)
  create_time = try(local.m614["create_time"], null)
  domain_group_moid = try(local.m614["domain_group_moid"], null)
  gateway = try(local.m614["gateway"], null)
  id = try(local.m614["id"], null)
  inventory_source = try(local.m614["inventory_source"], null)
  iscsi_cip = try(local.m614["iscsi_cip"], null)
  mod_time = try(local.m614["mod_time"], null)
  moid = try(local.m614["moid"], null)
  mtu = try(local.m614["mtu"], null)
  name = try(local.m614["name"], null)
  nr_version = try(local.m614["nr_version"], null)
  object_type = try(local.m614["object_type"], null)
  owners = try(local.m614["owners"], null)
  results = try(local.m614["results"], null)
  shared_scope = try(local.m614["shared_scope"], null)
  subnet = try(local.m614["subnet"], null)
  ucs_host = try(local.m614["ucs_host"], null)
  uuid = try(local.m614["uuid"], null)
  vlan_name = try(local.m614["vlan_name"], null)
  vlanid = try(local.m614["vlanid"], null)
  dynamic "ancestors" {
    for_each = try(local.m614["ancestors"], null) == null ? [] : local.m614["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m614["cluster"], null) == null ? [] : local.m614["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_ranges" {
    for_each = try(local.m614["ip_ranges"], null) == null ? [] : local.m614["ip_ranges"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m614["parent"], null) == null ? [] : local.m614["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m614["permission_resources"], null) == null ? [] : local.m614["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m614["tags"], null) == null ? [] : local.m614["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m614["version_context"], null) == null ? [] : local.m614["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
