# Sample data source intersight_hci_compliance — reads ../models/data_intersight_hci_compliance.yml
locals { m525 = yamldecode(file("${path.module}/../models/data_intersight_hci_compliance.yml"))["data_intersight_hci_compliance"] }

data "intersight_hci_compliance" "n525" {
  account_moid = try(local.m525["account_moid"], null)
  additional_properties = try(local.m525["additional_properties"], null)
  class_id = try(local.m525["class_id"], null)
  cluster_ext_id = try(local.m525["cluster_ext_id"], null)
  compliance_state = try(local.m525["compliance_state"], null)
  create_time = try(local.m525["create_time"], null)
  domain_group_moid = try(local.m525["domain_group_moid"], null)
  id = try(local.m525["id"], null)
  mod_time = try(local.m525["mod_time"], null)
  moid = try(local.m525["moid"], null)
  non_compliance_count = try(local.m525["non_compliance_count"], null)
  object_type = try(local.m525["object_type"], null)
  owners = try(local.m525["owners"], null)
  results = try(local.m525["results"], null)
  shared_scope = try(local.m525["shared_scope"], null)
  type = try(local.m525["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m525["ancestors"], null) == null ? [] : local.m525["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m525["cluster"], null) == null ? [] : local.m525["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m525["parent"], null) == null ? [] : local.m525["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m525["permission_resources"], null) == null ? [] : local.m525["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m525["registered_device"], null) == null ? [] : local.m525["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "services" {
    for_each = try(local.m525["services"], null) == null ? [] : local.m525["services"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m525["tags"], null) == null ? [] : local.m525["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m525["version_context"], null) == null ? [] : local.m525["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
