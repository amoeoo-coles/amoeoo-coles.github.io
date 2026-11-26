# Sample data source intersight_hci_violation — reads ../models/data_intersight_hci_violation.yml
locals { m539 = yamldecode(file("${path.module}/../models/data_intersight_hci_violation.yml"))["data_intersight_hci_violation"] }

data "intersight_hci_violation" "n539" {
  account_moid = try(local.m539["account_moid"], null)
  additional_properties = try(local.m539["additional_properties"], null)
  class_id = try(local.m539["class_id"], null)
  cluster_ext_id = try(local.m539["cluster_ext_id"], null)
  create_time = try(local.m539["create_time"], null)
  domain_group_moid = try(local.m539["domain_group_moid"], null)
  id = try(local.m539["id"], null)
  is_multicluster = try(local.m539["is_multicluster"], null)
  mod_time = try(local.m539["mod_time"], null)
  moid = try(local.m539["moid"], null)
  object_type = try(local.m539["object_type"], null)
  owners = try(local.m539["owners"], null)
  results = try(local.m539["results"], null)
  shared_scope = try(local.m539["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m539["ancestors"], null) == null ? [] : local.m539["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capacity_violations" {
    for_each = try(local.m539["capacity_violations"], null) == null ? [] : local.m539["capacity_violations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m539["cluster"], null) == null ? [] : local.m539["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "expired_licenses" {
    for_each = try(local.m539["expired_licenses"], null) == null ? [] : local.m539["expired_licenses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "feature_violations" {
    for_each = try(local.m539["feature_violations"], null) == null ? [] : local.m539["feature_violations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m539["parent"], null) == null ? [] : local.m539["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m539["permission_resources"], null) == null ? [] : local.m539["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m539["registered_device"], null) == null ? [] : local.m539["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m539["tags"], null) == null ? [] : local.m539["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m539["version_context"], null) == null ? [] : local.m539["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
