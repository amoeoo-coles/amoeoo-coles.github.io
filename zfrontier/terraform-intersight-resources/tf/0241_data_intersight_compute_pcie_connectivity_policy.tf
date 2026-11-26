# Sample data source intersight_compute_pcie_connectivity_policy — reads ../models/data_intersight_compute_pcie_connectivity_policy.yml
locals { m241 = yamldecode(file("${path.module}/../models/data_intersight_compute_pcie_connectivity_policy.yml"))["data_intersight_compute_pcie_connectivity_policy"] }

data "intersight_compute_pcie_connectivity_policy" "n241" {
  account_moid = try(local.m241["account_moid"], null)
  additional_properties = try(local.m241["additional_properties"], null)
  class_id = try(local.m241["class_id"], null)
  create_time = try(local.m241["create_time"], null)
  description = try(local.m241["description"], null)
  domain_group_moid = try(local.m241["domain_group_moid"], null)
  id = try(local.m241["id"], null)
  mod_time = try(local.m241["mod_time"], null)
  moid = try(local.m241["moid"], null)
  name = try(local.m241["name"], null)
  object_type = try(local.m241["object_type"], null)
  owners = try(local.m241["owners"], null)
  results = try(local.m241["results"], null)
  shared_scope = try(local.m241["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m241["ancestors"], null) == null ? [] : local.m241["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m241["organization"], null) == null ? [] : local.m241["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m241["parent"], null) == null ? [] : local.m241["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pcie_zones" {
    for_each = try(local.m241["pcie_zones"], null) == null ? [] : local.m241["pcie_zones"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m241["permission_resources"], null) == null ? [] : local.m241["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m241["profiles"], null) == null ? [] : local.m241["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m241["tags"], null) == null ? [] : local.m241["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m241["version_context"], null) == null ? [] : local.m241["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
