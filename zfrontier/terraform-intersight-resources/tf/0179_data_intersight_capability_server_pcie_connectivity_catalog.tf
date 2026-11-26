# Sample data source intersight_capability_server_pcie_connectivity_catalog — reads ../models/data_intersight_capability_server_pcie_connectivity_catalog.yml
locals { m179 = yamldecode(file("${path.module}/../models/data_intersight_capability_server_pcie_connectivity_catalog.yml"))["data_intersight_capability_server_pcie_connectivity_catalog"] }

data "intersight_capability_server_pcie_connectivity_catalog" "n179" {
  account_moid = try(local.m179["account_moid"], null)
  additional_properties = try(local.m179["additional_properties"], null)
  class_id = try(local.m179["class_id"], null)
  create_time = try(local.m179["create_time"], null)
  domain_group_moid = try(local.m179["domain_group_moid"], null)
  id = try(local.m179["id"], null)
  mod_time = try(local.m179["mod_time"], null)
  moid = try(local.m179["moid"], null)
  name = try(local.m179["name"], null)
  object_type = try(local.m179["object_type"], null)
  owners = try(local.m179["owners"], null)
  results = try(local.m179["results"], null)
  shared_scope = try(local.m179["shared_scope"], null)
  supported_number_of_gpus = try(local.m179["supported_number_of_gpus"], null)
  dynamic "ancestors" {
    for_each = try(local.m179["ancestors"], null) == null ? [] : local.m179["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m179["parent"], null) == null ? [] : local.m179["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m179["permission_resources"], null) == null ? [] : local.m179["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "supported_layouts" {
    for_each = try(local.m179["supported_layouts"], null) == null ? [] : local.m179["supported_layouts"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m179["tags"], null) == null ? [] : local.m179["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m179["version_context"], null) == null ? [] : local.m179["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
