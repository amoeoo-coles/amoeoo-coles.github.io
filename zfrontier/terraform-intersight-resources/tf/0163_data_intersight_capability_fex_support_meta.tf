# Sample data source intersight_capability_fex_support_meta — reads ../models/data_intersight_capability_fex_support_meta.yml
locals { m163 = yamldecode(file("${path.module}/../models/data_intersight_capability_fex_support_meta.yml"))["data_intersight_capability_fex_support_meta"] }

data "intersight_capability_fex_support_meta" "n163" {
  account_moid = try(local.m163["account_moid"], null)
  additional_properties = try(local.m163["additional_properties"], null)
  class_id = try(local.m163["class_id"], null)
  create_time = try(local.m163["create_time"], null)
  description = try(local.m163["description"], null)
  domain_group_moid = try(local.m163["domain_group_moid"], null)
  id = try(local.m163["id"], null)
  mod_time = try(local.m163["mod_time"], null)
  moid = try(local.m163["moid"], null)
  name = try(local.m163["name"], null)
  object_type = try(local.m163["object_type"], null)
  owners = try(local.m163["owners"], null)
  results = try(local.m163["results"], null)
  series_id = try(local.m163["series_id"], null)
  shared_scope = try(local.m163["shared_scope"], null)
  supported_models = try(local.m163["supported_models"], null)
  dynamic "ancestors" {
    for_each = try(local.m163["ancestors"], null) == null ? [] : local.m163["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m163["parent"], null) == null ? [] : local.m163["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m163["permission_resources"], null) == null ? [] : local.m163["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m163["tags"], null) == null ? [] : local.m163["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m163["version_context"], null) == null ? [] : local.m163["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
