# Sample data source intersight_hci_entitlement — reads ../models/data_intersight_hci_entitlement.yml
locals { m528 = yamldecode(file("${path.module}/../models/data_intersight_hci_entitlement.yml"))["data_intersight_hci_entitlement"] }

data "intersight_hci_entitlement" "n528" {
  account_moid = try(local.m528["account_moid"], null)
  additional_properties = try(local.m528["additional_properties"], null)
  class_id = try(local.m528["class_id"], null)
  cluster_ext_id = try(local.m528["cluster_ext_id"], null)
  create_time = try(local.m528["create_time"], null)
  domain_group_moid = try(local.m528["domain_group_moid"], null)
  id = try(local.m528["id"], null)
  mod_time = try(local.m528["mod_time"], null)
  moid = try(local.m528["moid"], null)
  object_type = try(local.m528["object_type"], null)
  owners = try(local.m528["owners"], null)
  results = try(local.m528["results"], null)
  shared_scope = try(local.m528["shared_scope"], null)
  type = try(local.m528["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m528["ancestors"], null) == null ? [] : local.m528["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m528["cluster"], null) == null ? [] : local.m528["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "details" {
    for_each = try(local.m528["details"], null) == null ? [] : local.m528["details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m528["parent"], null) == null ? [] : local.m528["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m528["permission_resources"], null) == null ? [] : local.m528["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m528["registered_device"], null) == null ? [] : local.m528["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m528["tags"], null) == null ? [] : local.m528["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m528["version_context"], null) == null ? [] : local.m528["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
