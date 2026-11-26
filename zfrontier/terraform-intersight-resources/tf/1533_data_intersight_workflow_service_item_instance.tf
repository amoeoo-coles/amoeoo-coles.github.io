# Sample data source intersight_workflow_service_item_instance — reads ../models/data_intersight_workflow_service_item_instance.yml
locals { m1533 = yamldecode(file("${path.module}/../models/data_intersight_workflow_service_item_instance.yml"))["data_intersight_workflow_service_item_instance"] }

data "intersight_workflow_service_item_instance" "n1533" {
  account_moid = try(local.m1533["account_moid"], null)
  additional_properties = try(local.m1533["additional_properties"], null)
  class_id = try(local.m1533["class_id"], null)
  create_time = try(local.m1533["create_time"], null)
  description = try(local.m1533["description"], null)
  domain_group_moid = try(local.m1533["domain_group_moid"], null)
  id = try(local.m1533["id"], null)
  label = try(local.m1533["label"], null)
  last_status = try(local.m1533["last_status"], null)
  mod_time = try(local.m1533["mod_time"], null)
  moid = try(local.m1533["moid"], null)
  name = try(local.m1533["name"], null)
  object_type = try(local.m1533["object_type"], null)
  owners = try(local.m1533["owners"], null)
  resourcelifecycle_status = try(local.m1533["resourcelifecycle_status"], null)
  results = try(local.m1533["results"], null)
  shared_scope = try(local.m1533["shared_scope"], null)
  status = try(local.m1533["status"], null)
  user_id_or_email = try(local.m1533["user_id_or_email"], null)
  dynamic "ancestors" {
    for_each = try(local.m1533["ancestors"], null) == null ? [] : local.m1533["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog_service_request" {
    for_each = try(local.m1533["catalog_service_request"], null) == null ? [] : local.m1533["catalog_service_request"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp" {
    for_each = try(local.m1533["idp"], null) == null ? [] : local.m1533["idp"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp_reference" {
    for_each = try(local.m1533["idp_reference"], null) == null ? [] : local.m1533["idp_reference"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "migration_history" {
    for_each = try(local.m1533["migration_history"], null) == null ? [] : local.m1533["migration_history"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1533["organization"], null) == null ? [] : local.m1533["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1533["parent"], null) == null ? [] : local.m1533["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1533["permission_resources"], null) == null ? [] : local.m1533["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_item_definition" {
    for_each = try(local.m1533["service_item_definition"], null) == null ? [] : local.m1533["service_item_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1533["tags"], null) == null ? [] : local.m1533["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m1533["user"], null) == null ? [] : local.m1533["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1533["version_context"], null) == null ? [] : local.m1533["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
