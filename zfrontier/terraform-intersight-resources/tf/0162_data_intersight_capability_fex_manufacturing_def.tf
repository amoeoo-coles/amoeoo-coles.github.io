# Sample data source intersight_capability_fex_manufacturing_def — reads ../models/data_intersight_capability_fex_manufacturing_def.yml
locals { m162 = yamldecode(file("${path.module}/../models/data_intersight_capability_fex_manufacturing_def.yml"))["data_intersight_capability_fex_manufacturing_def"] }

data "intersight_capability_fex_manufacturing_def" "n162" {
  account_moid = try(local.m162["account_moid"], null)
  additional_properties = try(local.m162["additional_properties"], null)
  caption = try(local.m162["caption"], null)
  class_id = try(local.m162["class_id"], null)
  create_time = try(local.m162["create_time"], null)
  description = try(local.m162["description"], null)
  domain_group_moid = try(local.m162["domain_group_moid"], null)
  fex_code_name = try(local.m162["fex_code_name"], null)
  id = try(local.m162["id"], null)
  mod_time = try(local.m162["mod_time"], null)
  moid = try(local.m162["moid"], null)
  name = try(local.m162["name"], null)
  object_type = try(local.m162["object_type"], null)
  owners = try(local.m162["owners"], null)
  pid = try(local.m162["pid"], null)
  product_name = try(local.m162["product_name"], null)
  results = try(local.m162["results"], null)
  shared_scope = try(local.m162["shared_scope"], null)
  sku = try(local.m162["sku"], null)
  vid = try(local.m162["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m162["ancestors"], null) == null ? [] : local.m162["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m162["parent"], null) == null ? [] : local.m162["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m162["permission_resources"], null) == null ? [] : local.m162["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m162["tags"], null) == null ? [] : local.m162["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m162["version_context"], null) == null ? [] : local.m162["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
