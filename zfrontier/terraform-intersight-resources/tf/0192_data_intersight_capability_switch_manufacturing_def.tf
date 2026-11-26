# Sample data source intersight_capability_switch_manufacturing_def — reads ../models/data_intersight_capability_switch_manufacturing_def.yml
locals { m192 = yamldecode(file("${path.module}/../models/data_intersight_capability_switch_manufacturing_def.yml"))["data_intersight_capability_switch_manufacturing_def"] }

data "intersight_capability_switch_manufacturing_def" "n192" {
  account_moid = try(local.m192["account_moid"], null)
  additional_properties = try(local.m192["additional_properties"], null)
  caption = try(local.m192["caption"], null)
  class_id = try(local.m192["class_id"], null)
  create_time = try(local.m192["create_time"], null)
  description = try(local.m192["description"], null)
  domain_group_moid = try(local.m192["domain_group_moid"], null)
  id = try(local.m192["id"], null)
  mod_time = try(local.m192["mod_time"], null)
  moid = try(local.m192["moid"], null)
  name = try(local.m192["name"], null)
  object_type = try(local.m192["object_type"], null)
  owners = try(local.m192["owners"], null)
  part_number = try(local.m192["part_number"], null)
  pid = try(local.m192["pid"], null)
  product_name = try(local.m192["product_name"], null)
  results = try(local.m192["results"], null)
  shared_scope = try(local.m192["shared_scope"], null)
  sku = try(local.m192["sku"], null)
  vid = try(local.m192["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m192["ancestors"], null) == null ? [] : local.m192["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m192["parent"], null) == null ? [] : local.m192["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m192["permission_resources"], null) == null ? [] : local.m192["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m192["tags"], null) == null ? [] : local.m192["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m192["version_context"], null) == null ? [] : local.m192["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
