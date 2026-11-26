# Sample data source intersight_capability_sioc_module_manufacturing_def — reads ../models/data_intersight_capability_sioc_module_manufacturing_def.yml
locals { m185 = yamldecode(file("${path.module}/../models/data_intersight_capability_sioc_module_manufacturing_def.yml"))["data_intersight_capability_sioc_module_manufacturing_def"] }

data "intersight_capability_sioc_module_manufacturing_def" "n185" {
  account_moid = try(local.m185["account_moid"], null)
  additional_properties = try(local.m185["additional_properties"], null)
  caption = try(local.m185["caption"], null)
  class_id = try(local.m185["class_id"], null)
  create_time = try(local.m185["create_time"], null)
  description = try(local.m185["description"], null)
  domain_group_moid = try(local.m185["domain_group_moid"], null)
  id = try(local.m185["id"], null)
  mod_time = try(local.m185["mod_time"], null)
  moid = try(local.m185["moid"], null)
  name = try(local.m185["name"], null)
  object_type = try(local.m185["object_type"], null)
  owners = try(local.m185["owners"], null)
  pid = try(local.m185["pid"], null)
  product_name = try(local.m185["product_name"], null)
  results = try(local.m185["results"], null)
  shared_scope = try(local.m185["shared_scope"], null)
  sku = try(local.m185["sku"], null)
  vid = try(local.m185["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m185["ancestors"], null) == null ? [] : local.m185["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m185["parent"], null) == null ? [] : local.m185["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m185["permission_resources"], null) == null ? [] : local.m185["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m185["tags"], null) == null ? [] : local.m185["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m185["version_context"], null) == null ? [] : local.m185["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
