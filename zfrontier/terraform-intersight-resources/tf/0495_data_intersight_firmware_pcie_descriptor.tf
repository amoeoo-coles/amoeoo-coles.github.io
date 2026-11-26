# Sample data source intersight_firmware_pcie_descriptor — reads ../models/data_intersight_firmware_pcie_descriptor.yml
locals { m495 = yamldecode(file("${path.module}/../models/data_intersight_firmware_pcie_descriptor.yml"))["data_intersight_firmware_pcie_descriptor"] }

data "intersight_firmware_pcie_descriptor" "n495" {
  account_moid = try(local.m495["account_moid"], null)
  additional_properties = try(local.m495["additional_properties"], null)
  brand_string = try(local.m495["brand_string"], null)
  class_id = try(local.m495["class_id"], null)
  create_time = try(local.m495["create_time"], null)
  description = try(local.m495["description"], null)
  domain_group_moid = try(local.m495["domain_group_moid"], null)
  id = try(local.m495["id"], null)
  label = try(local.m495["label"], null)
  mod_time = try(local.m495["mod_time"], null)
  model = try(local.m495["model"], null)
  moid = try(local.m495["moid"], null)
  nr_version = try(local.m495["nr_version"], null)
  object_type = try(local.m495["object_type"], null)
  owners = try(local.m495["owners"], null)
  results = try(local.m495["results"], null)
  revision = try(local.m495["revision"], null)
  shared_scope = try(local.m495["shared_scope"], null)
  vendor = try(local.m495["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m495["ancestors"], null) == null ? [] : local.m495["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m495["capabilities"], null) == null ? [] : local.m495["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m495["parent"], null) == null ? [] : local.m495["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m495["permission_resources"], null) == null ? [] : local.m495["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m495["tags"], null) == null ? [] : local.m495["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m495["version_context"], null) == null ? [] : local.m495["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
