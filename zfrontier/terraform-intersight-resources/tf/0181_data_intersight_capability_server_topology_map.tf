# Sample data source intersight_capability_server_topology_map — reads ../models/data_intersight_capability_server_topology_map.yml
locals { m181 = yamldecode(file("${path.module}/../models/data_intersight_capability_server_topology_map.yml"))["data_intersight_capability_server_topology_map"] }

data "intersight_capability_server_topology_map" "n181" {
  account_moid = try(local.m181["account_moid"], null)
  additional_properties = try(local.m181["additional_properties"], null)
  class_id = try(local.m181["class_id"], null)
  create_time = try(local.m181["create_time"], null)
  domain_group_moid = try(local.m181["domain_group_moid"], null)
  handler = try(local.m181["handler"], null)
  id = try(local.m181["id"], null)
  mod_time = try(local.m181["mod_time"], null)
  moid = try(local.m181["moid"], null)
  name = try(local.m181["name"], null)
  object_type = try(local.m181["object_type"], null)
  owners = try(local.m181["owners"], null)
  results = try(local.m181["results"], null)
  shared_scope = try(local.m181["shared_scope"], null)
  supported_topology_name = try(local.m181["supported_topology_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m181["ancestors"], null) == null ? [] : local.m181["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m181["parent"], null) == null ? [] : local.m181["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pcie_node_detail" {
    for_each = try(local.m181["pcie_node_detail"], null) == null ? [] : local.m181["pcie_node_detail"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m181["permission_resources"], null) == null ? [] : local.m181["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_detail" {
    for_each = try(local.m181["server_detail"], null) == null ? [] : local.m181["server_detail"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m181["tags"], null) == null ? [] : local.m181["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m181["version_context"], null) == null ? [] : local.m181["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "xfm_detail" {
    for_each = try(local.m181["xfm_detail"], null) == null ? [] : local.m181["xfm_detail"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
