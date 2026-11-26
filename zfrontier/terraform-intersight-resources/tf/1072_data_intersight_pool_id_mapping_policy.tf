# Sample data source intersight_pool_id_mapping_policy — reads ../models/data_intersight_pool_id_mapping_policy.yml
locals { m1072 = yamldecode(file("${path.module}/../models/data_intersight_pool_id_mapping_policy.yml"))["data_intersight_pool_id_mapping_policy"] }

data "intersight_pool_id_mapping_policy" "n1072" {
  account_moid = try(local.m1072["account_moid"], null)
  additional_properties = try(local.m1072["additional_properties"], null)
  class_id = try(local.m1072["class_id"], null)
  create_time = try(local.m1072["create_time"], null)
  description = try(local.m1072["description"], null)
  domain_group_moid = try(local.m1072["domain_group_moid"], null)
  id = try(local.m1072["id"], null)
  mod_time = try(local.m1072["mod_time"], null)
  moid = try(local.m1072["moid"], null)
  name = try(local.m1072["name"], null)
  object_type = try(local.m1072["object_type"], null)
  owners = try(local.m1072["owners"], null)
  results = try(local.m1072["results"], null)
  shared_scope = try(local.m1072["shared_scope"], null)
  usage_count = try(local.m1072["usage_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m1072["ancestors"], null) == null ? [] : local.m1072["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "exported_selectors" {
    for_each = try(local.m1072["exported_selectors"], null) == null ? [] : local.m1072["exported_selectors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1072["organization"], null) == null ? [] : local.m1072["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1072["parent"], null) == null ? [] : local.m1072["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "per_type_combined_selector" {
    for_each = try(local.m1072["per_type_combined_selector"], null) == null ? [] : local.m1072["per_type_combined_selector"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1072["permission_resources"], null) == null ? [] : local.m1072["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "selectors" {
    for_each = try(local.m1072["selectors"], null) == null ? [] : local.m1072["selectors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1072["tags"], null) == null ? [] : local.m1072["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1072["version_context"], null) == null ? [] : local.m1072["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
