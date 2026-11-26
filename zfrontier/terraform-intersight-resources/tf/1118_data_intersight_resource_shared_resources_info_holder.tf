# Sample data source intersight_resource_shared_resources_info_holder — reads ../models/data_intersight_resource_shared_resources_info_holder.yml
locals { m1118 = yamldecode(file("${path.module}/../models/data_intersight_resource_shared_resources_info_holder.yml"))["data_intersight_resource_shared_resources_info_holder"] }

data "intersight_resource_shared_resources_info_holder" "n1118" {
  account_moid = try(local.m1118["account_moid"], null)
  additional_properties = try(local.m1118["additional_properties"], null)
  class_id = try(local.m1118["class_id"], null)
  create_time = try(local.m1118["create_time"], null)
  domain_group_moid = try(local.m1118["domain_group_moid"], null)
  id = try(local.m1118["id"], null)
  mod_time = try(local.m1118["mod_time"], null)
  moid = try(local.m1118["moid"], null)
  object_type = try(local.m1118["object_type"], null)
  owners = try(local.m1118["owners"], null)
  results = try(local.m1118["results"], null)
  shared_scope = try(local.m1118["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m1118["account"], null) == null ? [] : local.m1118["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1118["ancestors"], null) == null ? [] : local.m1118["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1118["parent"], null) == null ? [] : local.m1118["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer_objects" {
    for_each = try(local.m1118["peer_objects"], null) == null ? [] : local.m1118["peer_objects"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1118["permission_resources"], null) == null ? [] : local.m1118["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "shared_resource" {
    for_each = try(local.m1118["shared_resource"], null) == null ? [] : local.m1118["shared_resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "shared_with_resource" {
    for_each = try(local.m1118["shared_with_resource"], null) == null ? [] : local.m1118["shared_with_resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sharing_rule" {
    for_each = try(local.m1118["sharing_rule"], null) == null ? [] : local.m1118["sharing_rule"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "source_object" {
    for_each = try(local.m1118["source_object"], null) == null ? [] : local.m1118["source_object"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1118["tags"], null) == null ? [] : local.m1118["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1118["version_context"], null) == null ? [] : local.m1118["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
