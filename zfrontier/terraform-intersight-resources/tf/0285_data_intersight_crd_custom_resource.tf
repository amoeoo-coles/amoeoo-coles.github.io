# Sample data source intersight_crd_custom_resource — reads ../models/data_intersight_crd_custom_resource.yml
locals { m285 = yamldecode(file("${path.module}/../models/data_intersight_crd_custom_resource.yml"))["data_intersight_crd_custom_resource"] }

data "intersight_crd_custom_resource" "n285" {
  account_moid = try(local.m285["account_moid"], null)
  additional_properties = try(local.m285["additional_properties"], null)
  class_id = try(local.m285["class_id"], null)
  create_time = try(local.m285["create_time"], null)
  dc_launcher = try(local.m285["dc_launcher"], null)
  domain_group_moid = try(local.m285["domain_group_moid"], null)
  id = try(local.m285["id"], null)
  image = try(local.m285["image"], null)
  mod_time = try(local.m285["mod_time"], null)
  moid = try(local.m285["moid"], null)
  name = try(local.m285["name"], null)
  namespace = try(local.m285["namespace"], null)
  object_type = try(local.m285["object_type"], null)
  owners = try(local.m285["owners"], null)
  port = try(local.m285["port"], null)
  results = try(local.m285["results"], null)
  shared_scope = try(local.m285["shared_scope"], null)
  target_id = try(local.m285["target_id"], null)
  target_moid = try(local.m285["target_moid"], null)
  target_type = try(local.m285["target_type"], null)
  dynamic "account" {
    for_each = try(local.m285["account"], null) == null ? [] : local.m285["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m285["ancestors"], null) == null ? [] : local.m285["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m285["parent"], null) == null ? [] : local.m285["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m285["permission_resources"], null) == null ? [] : local.m285["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "properties" {
    for_each = try(local.m285["properties"], null) == null ? [] : local.m285["properties"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m285["tags"], null) == null ? [] : local.m285["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m285["version_context"], null) == null ? [] : local.m285["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
