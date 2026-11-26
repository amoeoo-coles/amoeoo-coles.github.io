# Sample data source intersight_compute_pcie_connectivity_policy_inventory — reads ../models/data_intersight_compute_pcie_connectivity_policy_inventory.yml
locals { m242 = yamldecode(file("${path.module}/../models/data_intersight_compute_pcie_connectivity_policy_inventory.yml"))["data_intersight_compute_pcie_connectivity_policy_inventory"] }

data "intersight_compute_pcie_connectivity_policy_inventory" "n242" {
  account_moid = try(local.m242["account_moid"], null)
  additional_properties = try(local.m242["additional_properties"], null)
  class_id = try(local.m242["class_id"], null)
  create_time = try(local.m242["create_time"], null)
  description = try(local.m242["description"], null)
  device_mo_id = try(local.m242["device_mo_id"], null)
  domain_group_moid = try(local.m242["domain_group_moid"], null)
  id = try(local.m242["id"], null)
  mod_time = try(local.m242["mod_time"], null)
  moid = try(local.m242["moid"], null)
  name = try(local.m242["name"], null)
  object_type = try(local.m242["object_type"], null)
  owners = try(local.m242["owners"], null)
  results = try(local.m242["results"], null)
  shared_scope = try(local.m242["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m242["ancestors"], null) == null ? [] : local.m242["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m242["parent"], null) == null ? [] : local.m242["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pcie_zones" {
    for_each = try(local.m242["pcie_zones"], null) == null ? [] : local.m242["pcie_zones"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m242["permission_resources"], null) == null ? [] : local.m242["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m242["tags"], null) == null ? [] : local.m242["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m242["target_mo"], null) == null ? [] : local.m242["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m242["version_context"], null) == null ? [] : local.m242["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
