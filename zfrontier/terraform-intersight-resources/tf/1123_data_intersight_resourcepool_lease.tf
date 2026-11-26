# Sample data source intersight_resourcepool_lease — reads ../models/data_intersight_resourcepool_lease.yml
locals { m1123 = yamldecode(file("${path.module}/../models/data_intersight_resourcepool_lease.yml"))["data_intersight_resourcepool_lease"] }

data "intersight_resourcepool_lease" "n1123" {
  account_moid = try(local.m1123["account_moid"], null)
  additional_properties = try(local.m1123["additional_properties"], null)
  allocation_type = try(local.m1123["allocation_type"], null)
  class_id = try(local.m1123["class_id"], null)
  create_time = try(local.m1123["create_time"], null)
  domain_group_moid = try(local.m1123["domain_group_moid"], null)
  feature = try(local.m1123["feature"], null)
  has_duplicate = try(local.m1123["has_duplicate"], null)
  id = try(local.m1123["id"], null)
  is_exclusive_at_assigned_entity = try(local.m1123["is_exclusive_at_assigned_entity"], null)
  migrate = try(local.m1123["migrate"], null)
  mod_time = try(local.m1123["mod_time"], null)
  moid = try(local.m1123["moid"], null)
  object_type = try(local.m1123["object_type"], null)
  owners = try(local.m1123["owners"], null)
  resource_type = try(local.m1123["resource_type"], null)
  results = try(local.m1123["results"], null)
  shared_scope = try(local.m1123["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1123["ancestors"], null) == null ? [] : local.m1123["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_to_entity" {
    for_each = try(local.m1123["assigned_to_entity"], null) == null ? [] : local.m1123["assigned_to_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "child_lease_condition" {
    for_each = try(local.m1123["child_lease_condition"], null) == null ? [] : local.m1123["child_lease_condition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "condition" {
    for_each = try(local.m1123["condition"], null) == null ? [] : local.m1123["condition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "lease_parameters" {
    for_each = try(local.m1123["lease_parameters"], null) == null ? [] : local.m1123["lease_parameters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "leased_resource" {
    for_each = try(local.m1123["leased_resource"], null) == null ? [] : local.m1123["leased_resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1123["parent"], null) == null ? [] : local.m1123["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1123["permission_resources"], null) == null ? [] : local.m1123["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m1123["pool"], null) == null ? [] : local.m1123["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool_member" {
    for_each = try(local.m1123["pool_member"], null) == null ? [] : local.m1123["pool_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource" {
    for_each = try(local.m1123["resource"], null) == null ? [] : local.m1123["resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1123["tags"], null) == null ? [] : local.m1123["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "universe" {
    for_each = try(local.m1123["universe"], null) == null ? [] : local.m1123["universe"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1123["version_context"], null) == null ? [] : local.m1123["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
