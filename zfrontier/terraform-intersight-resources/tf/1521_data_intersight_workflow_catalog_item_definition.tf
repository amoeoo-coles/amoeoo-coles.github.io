# Sample data source intersight_workflow_catalog_item_definition — reads ../models/data_intersight_workflow_catalog_item_definition.yml
locals { m1521 = yamldecode(file("${path.module}/../models/data_intersight_workflow_catalog_item_definition.yml"))["data_intersight_workflow_catalog_item_definition"] }

data "intersight_workflow_catalog_item_definition" "n1521" {
  account_moid = try(local.m1521["account_moid"], null)
  additional_properties = try(local.m1521["additional_properties"], null)
  class_id = try(local.m1521["class_id"], null)
  create_time = try(local.m1521["create_time"], null)
  description = try(local.m1521["description"], null)
  domain_group_moid = try(local.m1521["domain_group_moid"], null)
  id = try(local.m1521["id"], null)
  label = try(local.m1521["label"], null)
  mod_time = try(local.m1521["mod_time"], null)
  moid = try(local.m1521["moid"], null)
  name = try(local.m1521["name"], null)
  nr_version = try(local.m1521["nr_version"], null)
  object_type = try(local.m1521["object_type"], null)
  owners = try(local.m1521["owners"], null)
  publish_status = try(local.m1521["publish_status"], null)
  results = try(local.m1521["results"], null)
  shared_scope = try(local.m1521["shared_scope"], null)
  support_status = try(local.m1521["support_status"], null)
  user_id_or_email = try(local.m1521["user_id_or_email"], null)
  dynamic "ancestors" {
    for_each = try(local.m1521["ancestors"], null) == null ? [] : local.m1521["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1521["organization"], null) == null ? [] : local.m1521["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1521["parent"], null) == null ? [] : local.m1521["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1521["permission_resources"], null) == null ? [] : local.m1521["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_items" {
    for_each = try(local.m1521["service_items"], null) == null ? [] : local.m1521["service_items"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1521["tags"], null) == null ? [] : local.m1521["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "validation_information" {
    for_each = try(local.m1521["validation_information"], null) == null ? [] : local.m1521["validation_information"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1521["version_context"], null) == null ? [] : local.m1521["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
