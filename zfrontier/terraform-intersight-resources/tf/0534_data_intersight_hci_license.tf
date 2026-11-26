# Sample data source intersight_hci_license — reads ../models/data_intersight_hci_license.yml
locals { m534 = yamldecode(file("${path.module}/../models/data_intersight_hci_license.yml"))["data_intersight_hci_license"] }

data "intersight_hci_license" "n534" {
  account_moid = try(local.m534["account_moid"], null)
  additional_properties = try(local.m534["additional_properties"], null)
  category = try(local.m534["category"], null)
  class_id = try(local.m534["class_id"], null)
  create_time = try(local.m534["create_time"], null)
  domain_group_moid = try(local.m534["domain_group_moid"], null)
  expiry_date = try(local.m534["expiry_date"], null)
  ext_id = try(local.m534["ext_id"], null)
  id = try(local.m534["id"], null)
  license_id = try(local.m534["license_id"], null)
  meter = try(local.m534["meter"], null)
  mod_time = try(local.m534["mod_time"], null)
  moid = try(local.m534["moid"], null)
  name = try(local.m534["name"], null)
  object_type = try(local.m534["object_type"], null)
  owners = try(local.m534["owners"], null)
  pc_ext_id = try(local.m534["pc_ext_id"], null)
  quantity = try(local.m534["quantity"], null)
  results = try(local.m534["results"], null)
  scope = try(local.m534["scope"], null)
  shared_scope = try(local.m534["shared_scope"], null)
  sub_category = try(local.m534["sub_category"], null)
  type = try(local.m534["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m534["ancestors"], null) == null ? [] : local.m534["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "consumption_details" {
    for_each = try(local.m534["consumption_details"], null) == null ? [] : local.m534["consumption_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "domain_manager" {
    for_each = try(local.m534["domain_manager"], null) == null ? [] : local.m534["domain_manager"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m534["parent"], null) == null ? [] : local.m534["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m534["permission_resources"], null) == null ? [] : local.m534["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m534["registered_device"], null) == null ? [] : local.m534["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m534["tags"], null) == null ? [] : local.m534["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m534["version_context"], null) == null ? [] : local.m534["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
