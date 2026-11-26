# Sample data source intersight_workflow_catalog_service_request — reads ../models/data_intersight_workflow_catalog_service_request.yml
locals { m1522 = yamldecode(file("${path.module}/../models/data_intersight_workflow_catalog_service_request.yml"))["data_intersight_workflow_catalog_service_request"] }

data "intersight_workflow_catalog_service_request" "n1522" {
  account_moid = try(local.m1522["account_moid"], null)
  additional_properties = try(local.m1522["additional_properties"], null)
  class_id = try(local.m1522["class_id"], null)
  create_time = try(local.m1522["create_time"], null)
  description = try(local.m1522["description"], null)
  domain_group_moid = try(local.m1522["domain_group_moid"], null)
  end_time = try(local.m1522["end_time"], null)
  id = try(local.m1522["id"], null)
  input = try(local.m1522["input"], null)
  label = try(local.m1522["label"], null)
  mod_time = try(local.m1522["mod_time"], null)
  moid = try(local.m1522["moid"], null)
  name = try(local.m1522["name"], null)
  object_type = try(local.m1522["object_type"], null)
  owners = try(local.m1522["owners"], null)
  results = try(local.m1522["results"], null)
  shared_scope = try(local.m1522["shared_scope"], null)
  status = try(local.m1522["status"], null)
  user_id_or_email = try(local.m1522["user_id_or_email"], null)
  dynamic "ancestors" {
    for_each = try(local.m1522["ancestors"], null) == null ? [] : local.m1522["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog_item_definition" {
    for_each = try(local.m1522["catalog_item_definition"], null) == null ? [] : local.m1522["catalog_item_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp" {
    for_each = try(local.m1522["idp"], null) == null ? [] : local.m1522["idp"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp_reference" {
    for_each = try(local.m1522["idp_reference"], null) == null ? [] : local.m1522["idp_reference"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "messages" {
    for_each = try(local.m1522["messages"], null) == null ? [] : local.m1522["messages"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "operation" {
    for_each = try(local.m1522["operation"], null) == null ? [] : local.m1522["operation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1522["organization"], null) == null ? [] : local.m1522["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1522["parent"], null) == null ? [] : local.m1522["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1522["permission_resources"], null) == null ? [] : local.m1522["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "selection_criteria_inputs" {
    for_each = try(local.m1522["selection_criteria_inputs"], null) == null ? [] : local.m1522["selection_criteria_inputs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_item_action_instances" {
    for_each = try(local.m1522["service_item_action_instances"], null) == null ? [] : local.m1522["service_item_action_instances"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_item_instances" {
    for_each = try(local.m1522["service_item_instances"], null) == null ? [] : local.m1522["service_item_instances"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1522["tags"], null) == null ? [] : local.m1522["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m1522["user"], null) == null ? [] : local.m1522["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1522["version_context"], null) == null ? [] : local.m1522["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
