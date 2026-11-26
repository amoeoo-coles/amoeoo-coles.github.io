# Sample data source intersight_workflow_service_item_definition — reads ../models/data_intersight_workflow_service_item_definition.yml
locals { m1530 = yamldecode(file("${path.module}/../models/data_intersight_workflow_service_item_definition.yml"))["data_intersight_workflow_service_item_definition"] }

data "intersight_workflow_service_item_definition" "n1530" {
  account_moid = try(local.m1530["account_moid"], null)
  additional_properties = try(local.m1530["additional_properties"], null)
  allow_multiple_service_item_instances = try(local.m1530["allow_multiple_service_item_instances"], null)
  class_id = try(local.m1530["class_id"], null)
  create_time = try(local.m1530["create_time"], null)
  create_user = try(local.m1530["create_user"], null)
  cvd_id = try(local.m1530["cvd_id"], null)
  default_version = try(local.m1530["default_version"], null)
  delete_instance_on_decommission = try(local.m1530["delete_instance_on_decommission"], null)
  description = try(local.m1530["description"], null)
  domain_group_moid = try(local.m1530["domain_group_moid"], null)
  id = try(local.m1530["id"], null)
  label = try(local.m1530["label"], null)
  license_entitlement = try(local.m1530["license_entitlement"], null)
  mod_time = try(local.m1530["mod_time"], null)
  mod_user = try(local.m1530["mod_user"], null)
  moid = try(local.m1530["moid"], null)
  name = try(local.m1530["name"], null)
  nr_version = try(local.m1530["nr_version"], null)
  object_type = try(local.m1530["object_type"], null)
  owners = try(local.m1530["owners"], null)
  publish_status = try(local.m1530["publish_status"], null)
  results = try(local.m1530["results"], null)
  shared_scope = try(local.m1530["shared_scope"], null)
  status = try(local.m1530["status"], null)
  support_status = try(local.m1530["support_status"], null)
  user_id_or_email = try(local.m1530["user_id_or_email"], null)
  dynamic "action_definitions" {
    for_each = try(local.m1530["action_definitions"], null) == null ? [] : local.m1530["action_definitions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1530["ancestors"], null) == null ? [] : local.m1530["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "attribute_definition" {
    for_each = try(local.m1530["attribute_definition"], null) == null ? [] : local.m1530["attribute_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1530["catalog"], null) == null ? [] : local.m1530["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1530["parent"], null) == null ? [] : local.m1530["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1530["permission_resources"], null) == null ? [] : local.m1530["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "support_info" {
    for_each = try(local.m1530["support_info"], null) == null ? [] : local.m1530["support_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1530["tags"], null) == null ? [] : local.m1530["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "validation_information" {
    for_each = try(local.m1530["validation_information"], null) == null ? [] : local.m1530["validation_information"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1530["version_context"], null) == null ? [] : local.m1530["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
