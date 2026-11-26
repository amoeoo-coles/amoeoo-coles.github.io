# Sample data source intersight_capability_server_descriptor — reads ../models/data_intersight_capability_server_descriptor.yml
locals { m177 = yamldecode(file("${path.module}/../models/data_intersight_capability_server_descriptor.yml"))["data_intersight_capability_server_descriptor"] }

data "intersight_capability_server_descriptor" "n177" {
  account_moid = try(local.m177["account_moid"], null)
  additional_properties = try(local.m177["additional_properties"], null)
  class_id = try(local.m177["class_id"], null)
  create_time = try(local.m177["create_time"], null)
  description = try(local.m177["description"], null)
  domain_group_moid = try(local.m177["domain_group_moid"], null)
  full_width = try(local.m177["full_width"], null)
  id = try(local.m177["id"], null)
  is_ncsi_enabled = try(local.m177["is_ncsi_enabled"], null)
  is_ppl_enabled = try(local.m177["is_ppl_enabled"], null)
  mlom_adapter_pcie_slot_number = try(local.m177["mlom_adapter_pcie_slot_number"], null)
  mod_time = try(local.m177["mod_time"], null)
  model = try(local.m177["model"], null)
  moid = try(local.m177["moid"], null)
  nr_version = try(local.m177["nr_version"], null)
  object_type = try(local.m177["object_type"], null)
  owners = try(local.m177["owners"], null)
  results = try(local.m177["results"], null)
  server_form_factor = try(local.m177["server_form_factor"], null)
  shared_scope = try(local.m177["shared_scope"], null)
  supported_policies = try(local.m177["supported_policies"], null)
  unsupported_policies = try(local.m177["unsupported_policies"], null)
  vendor = try(local.m177["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m177["ancestors"], null) == null ? [] : local.m177["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m177["capabilities"], null) == null ? [] : local.m177["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m177["parent"], null) == null ? [] : local.m177["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m177["permission_resources"], null) == null ? [] : local.m177["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m177["tags"], null) == null ? [] : local.m177["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m177["version_context"], null) == null ? [] : local.m177["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
