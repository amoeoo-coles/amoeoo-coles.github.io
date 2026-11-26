# Sample data source intersight_resourcepool_pool — reads ../models/data_intersight_resourcepool_pool.yml
locals { m1126 = yamldecode(file("${path.module}/../models/data_intersight_resourcepool_pool.yml"))["data_intersight_resourcepool_pool"] }

data "intersight_resourcepool_pool" "n1126" {
  account_moid = try(local.m1126["account_moid"], null)
  action = try(local.m1126["action"], null)
  additional_properties = try(local.m1126["additional_properties"], null)
  assigned = try(local.m1126["assigned"], null)
  assignment_order = try(local.m1126["assignment_order"], null)
  class_id = try(local.m1126["class_id"], null)
  create_time = try(local.m1126["create_time"], null)
  description = try(local.m1126["description"], null)
  domain_group_moid = try(local.m1126["domain_group_moid"], null)
  id = try(local.m1126["id"], null)
  mod_time = try(local.m1126["mod_time"], null)
  moid = try(local.m1126["moid"], null)
  name = try(local.m1126["name"], null)
  object_type = try(local.m1126["object_type"], null)
  owners = try(local.m1126["owners"], null)
  pool_type = try(local.m1126["pool_type"], null)
  reserved = try(local.m1126["reserved"], null)
  resource_type = try(local.m1126["resource_type"], null)
  results = try(local.m1126["results"], null)
  shared_scope = try(local.m1126["shared_scope"], null)
  size = try(local.m1126["size"], null)
  dynamic "ancestors" {
    for_each = try(local.m1126["ancestors"], null) == null ? [] : local.m1126["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "exported_selectors" {
    for_each = try(local.m1126["exported_selectors"], null) == null ? [] : local.m1126["exported_selectors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1126["organization"], null) == null ? [] : local.m1126["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1126["parent"], null) == null ? [] : local.m1126["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1126["permission_resources"], null) == null ? [] : local.m1126["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "qualification_policies" {
    for_each = try(local.m1126["qualification_policies"], null) == null ? [] : local.m1126["qualification_policies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservations" {
    for_each = try(local.m1126["reservations"], null) == null ? [] : local.m1126["reservations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_evaluation_status" {
    for_each = try(local.m1126["resource_evaluation_status"], null) == null ? [] : local.m1126["resource_evaluation_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_pool_parameters" {
    for_each = try(local.m1126["resource_pool_parameters"], null) == null ? [] : local.m1126["resource_pool_parameters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "selectors" {
    for_each = try(local.m1126["selectors"], null) == null ? [] : local.m1126["selectors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1126["tags"], null) == null ? [] : local.m1126["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1126["version_context"], null) == null ? [] : local.m1126["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
