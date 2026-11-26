# Sample data source intersight_capability_psu_manufacturing_def — reads ../models/data_intersight_capability_psu_manufacturing_def.yml
locals { m175 = yamldecode(file("${path.module}/../models/data_intersight_capability_psu_manufacturing_def.yml"))["data_intersight_capability_psu_manufacturing_def"] }

data "intersight_capability_psu_manufacturing_def" "n175" {
  account_moid = try(local.m175["account_moid"], null)
  additional_properties = try(local.m175["additional_properties"], null)
  caption = try(local.m175["caption"], null)
  class_id = try(local.m175["class_id"], null)
  create_time = try(local.m175["create_time"], null)
  description = try(local.m175["description"], null)
  domain_group_moid = try(local.m175["domain_group_moid"], null)
  id = try(local.m175["id"], null)
  mod_time = try(local.m175["mod_time"], null)
  moid = try(local.m175["moid"], null)
  name = try(local.m175["name"], null)
  object_type = try(local.m175["object_type"], null)
  owners = try(local.m175["owners"], null)
  pid = try(local.m175["pid"], null)
  product_name = try(local.m175["product_name"], null)
  results = try(local.m175["results"], null)
  shared_scope = try(local.m175["shared_scope"], null)
  sku = try(local.m175["sku"], null)
  vid = try(local.m175["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m175["ancestors"], null) == null ? [] : local.m175["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m175["parent"], null) == null ? [] : local.m175["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m175["permission_resources"], null) == null ? [] : local.m175["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m175["tags"], null) == null ? [] : local.m175["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m175["version_context"], null) == null ? [] : local.m175["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
