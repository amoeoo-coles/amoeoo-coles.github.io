# Sample data source intersight_hci_domain_manager — reads ../models/data_intersight_hci_domain_manager.yml
locals { m527 = yamldecode(file("${path.module}/../models/data_intersight_hci_domain_manager.yml"))["data_intersight_hci_domain_manager"] }

data "intersight_hci_domain_manager" "n527" {
  account_moid = try(local.m527["account_moid"], null)
  additional_properties = try(local.m527["additional_properties"], null)
  api_limits_string = try(local.m527["api_limits_string"], null)
  class_id = try(local.m527["class_id"], null)
  create_time = try(local.m527["create_time"], null)
  domain_group_moid = try(local.m527["domain_group_moid"], null)
  id = try(local.m527["id"], null)
  lcm_connectivity_type = try(local.m527["lcm_connectivity_type"], null)
  mod_time = try(local.m527["mod_time"], null)
  moid = try(local.m527["moid"], null)
  name = try(local.m527["name"], null)
  object_type = try(local.m527["object_type"], null)
  owners = try(local.m527["owners"], null)
  pc_ext_id = try(local.m527["pc_ext_id"], null)
  results = try(local.m527["results"], null)
  shared_scope = try(local.m527["shared_scope"], null)
  size = try(local.m527["size"], null)
  dynamic "ancestors" {
    for_each = try(local.m527["ancestors"], null) == null ? [] : local.m527["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "api_limits" {
    for_each = try(local.m527["api_limits"], null) == null ? [] : local.m527["api_limits"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "clusters" {
    for_each = try(local.m527["clusters"], null) == null ? [] : local.m527["clusters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "licenses" {
    for_each = try(local.m527["licenses"], null) == null ? [] : local.m527["licenses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m527["parent"], null) == null ? [] : local.m527["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m527["permission_resources"], null) == null ? [] : local.m527["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m527["registered_device"], null) == null ? [] : local.m527["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m527["tags"], null) == null ? [] : local.m527["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m527["version_context"], null) == null ? [] : local.m527["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
