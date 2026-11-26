# Sample data source intersight_hci_cluster_operation — reads ../models/data_intersight_hci_cluster_operation.yml
locals { m524 = yamldecode(file("${path.module}/../models/data_intersight_hci_cluster_operation.yml"))["data_intersight_hci_cluster_operation"] }

data "intersight_hci_cluster_operation" "n524" {
  account_moid = try(local.m524["account_moid"], null)
  additional_properties = try(local.m524["additional_properties"], null)
  class_id = try(local.m524["class_id"], null)
  cluster_ext_id = try(local.m524["cluster_ext_id"], null)
  create_time = try(local.m524["create_time"], null)
  domain_group_moid = try(local.m524["domain_group_moid"], null)
  id = try(local.m524["id"], null)
  mod_time = try(local.m524["mod_time"], null)
  moid = try(local.m524["moid"], null)
  name = try(local.m524["name"], null)
  object_type = try(local.m524["object_type"], null)
  owners = try(local.m524["owners"], null)
  results = try(local.m524["results"], null)
  shared_scope = try(local.m524["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m524["ancestors"], null) == null ? [] : local.m524["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m524["cluster"], null) == null ? [] : local.m524["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_op_infos" {
    for_each = try(local.m524["cluster_op_infos"], null) == null ? [] : local.m524["cluster_op_infos"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nutanix_cluster_check" {
    for_each = try(local.m524["nutanix_cluster_check"], null) == null ? [] : local.m524["nutanix_cluster_check"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m524["parent"], null) == null ? [] : local.m524["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pending_workflow_triggers" {
    for_each = try(local.m524["pending_workflow_triggers"], null) == null ? [] : local.m524["pending_workflow_triggers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m524["permission_resources"], null) == null ? [] : local.m524["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m524["registered_device"], null) == null ? [] : local.m524["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "running_workflow" {
    for_each = try(local.m524["running_workflow"], null) == null ? [] : local.m524["running_workflow"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m524["tags"], null) == null ? [] : local.m524["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m524["version_context"], null) == null ? [] : local.m524["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
