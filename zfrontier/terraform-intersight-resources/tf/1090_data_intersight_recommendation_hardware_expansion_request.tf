# Sample data source intersight_recommendation_hardware_expansion_request — reads ../models/data_intersight_recommendation_hardware_expansion_request.yml
locals { m1090 = yamldecode(file("${path.module}/../models/data_intersight_recommendation_hardware_expansion_request.yml"))["data_intersight_recommendation_hardware_expansion_request"] }

data "intersight_recommendation_hardware_expansion_request" "n1090" {
  account_moid = try(local.m1090["account_moid"], null)
  action = try(local.m1090["action"], null)
  additional_properties = try(local.m1090["additional_properties"], null)
  class_id = try(local.m1090["class_id"], null)
  create_time = try(local.m1090["create_time"], null)
  domain_group_moid = try(local.m1090["domain_group_moid"], null)
  id = try(local.m1090["id"], null)
  message = try(local.m1090["message"], null)
  mod_time = try(local.m1090["mod_time"], null)
  moid = try(local.m1090["moid"], null)
  name = try(local.m1090["name"], null)
  object_type = try(local.m1090["object_type"], null)
  owners = try(local.m1090["owners"], null)
  request_time = try(local.m1090["request_time"], null)
  results = try(local.m1090["results"], null)
  shared_scope = try(local.m1090["shared_scope"], null)
  status = try(local.m1090["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m1090["ancestors"], null) == null ? [] : local.m1090["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hw_expansion_request_items" {
    for_each = try(local.m1090["hw_expansion_request_items"], null) == null ? [] : local.m1090["hw_expansion_request_items"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1090["parent"], null) == null ? [] : local.m1090["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1090["permission_resources"], null) == null ? [] : local.m1090["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1090["registered_device"], null) == null ? [] : local.m1090["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1090["tags"], null) == null ? [] : local.m1090["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1090["version_context"], null) == null ? [] : local.m1090["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
