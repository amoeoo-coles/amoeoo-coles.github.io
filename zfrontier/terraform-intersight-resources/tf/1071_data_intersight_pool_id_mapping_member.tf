# Sample data source intersight_pool_id_mapping_member — reads ../models/data_intersight_pool_id_mapping_member.yml
locals { m1071 = yamldecode(file("${path.module}/../models/data_intersight_pool_id_mapping_member.yml"))["data_intersight_pool_id_mapping_member"] }

data "intersight_pool_id_mapping_member" "n1071" {
  account_moid = try(local.m1071["account_moid"], null)
  additional_properties = try(local.m1071["additional_properties"], null)
  class_id = try(local.m1071["class_id"], null)
  create_time = try(local.m1071["create_time"], null)
  domain_group_moid = try(local.m1071["domain_group_moid"], null)
  id = try(local.m1071["id"], null)
  mod_time = try(local.m1071["mod_time"], null)
  moid = try(local.m1071["moid"], null)
  object_type = try(local.m1071["object_type"], null)
  owners = try(local.m1071["owners"], null)
  results = try(local.m1071["results"], null)
  shared_scope = try(local.m1071["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1071["ancestors"], null) == null ? [] : local.m1071["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "id_mapping_policy" {
    for_each = try(local.m1071["id_mapping_policy"], null) == null ? [] : local.m1071["id_mapping_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1071["parent"], null) == null ? [] : local.m1071["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1071["permission_resources"], null) == null ? [] : local.m1071["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource" {
    for_each = try(local.m1071["resource"], null) == null ? [] : local.m1071["resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1071["tags"], null) == null ? [] : local.m1071["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1071["version_context"], null) == null ? [] : local.m1071["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
