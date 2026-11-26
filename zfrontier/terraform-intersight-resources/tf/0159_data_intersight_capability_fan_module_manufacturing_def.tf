# Sample data source intersight_capability_fan_module_manufacturing_def — reads ../models/data_intersight_capability_fan_module_manufacturing_def.yml
locals { m159 = yamldecode(file("${path.module}/../models/data_intersight_capability_fan_module_manufacturing_def.yml"))["data_intersight_capability_fan_module_manufacturing_def"] }

data "intersight_capability_fan_module_manufacturing_def" "n159" {
  account_moid = try(local.m159["account_moid"], null)
  additional_properties = try(local.m159["additional_properties"], null)
  caption = try(local.m159["caption"], null)
  class_id = try(local.m159["class_id"], null)
  create_time = try(local.m159["create_time"], null)
  description = try(local.m159["description"], null)
  domain_group_moid = try(local.m159["domain_group_moid"], null)
  id = try(local.m159["id"], null)
  mod_time = try(local.m159["mod_time"], null)
  moid = try(local.m159["moid"], null)
  name = try(local.m159["name"], null)
  object_type = try(local.m159["object_type"], null)
  owners = try(local.m159["owners"], null)
  pid = try(local.m159["pid"], null)
  product_name = try(local.m159["product_name"], null)
  results = try(local.m159["results"], null)
  shared_scope = try(local.m159["shared_scope"], null)
  sku = try(local.m159["sku"], null)
  vid = try(local.m159["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m159["ancestors"], null) == null ? [] : local.m159["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m159["parent"], null) == null ? [] : local.m159["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m159["permission_resources"], null) == null ? [] : local.m159["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m159["tags"], null) == null ? [] : local.m159["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m159["version_context"], null) == null ? [] : local.m159["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
