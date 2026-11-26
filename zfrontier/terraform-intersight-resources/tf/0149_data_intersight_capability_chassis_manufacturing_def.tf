# Sample data source intersight_capability_chassis_manufacturing_def — reads ../models/data_intersight_capability_chassis_manufacturing_def.yml
locals { m149 = yamldecode(file("${path.module}/../models/data_intersight_capability_chassis_manufacturing_def.yml"))["data_intersight_capability_chassis_manufacturing_def"] }

data "intersight_capability_chassis_manufacturing_def" "n149" {
  account_moid = try(local.m149["account_moid"], null)
  additional_properties = try(local.m149["additional_properties"], null)
  caption = try(local.m149["caption"], null)
  chassis_code_name = try(local.m149["chassis_code_name"], null)
  class_id = try(local.m149["class_id"], null)
  create_time = try(local.m149["create_time"], null)
  description = try(local.m149["description"], null)
  domain_group_moid = try(local.m149["domain_group_moid"], null)
  id = try(local.m149["id"], null)
  mod_time = try(local.m149["mod_time"], null)
  moid = try(local.m149["moid"], null)
  name = try(local.m149["name"], null)
  object_type = try(local.m149["object_type"], null)
  owners = try(local.m149["owners"], null)
  pid = try(local.m149["pid"], null)
  product_name = try(local.m149["product_name"], null)
  results = try(local.m149["results"], null)
  shared_scope = try(local.m149["shared_scope"], null)
  sku = try(local.m149["sku"], null)
  vid = try(local.m149["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m149["ancestors"], null) == null ? [] : local.m149["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m149["parent"], null) == null ? [] : local.m149["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m149["permission_resources"], null) == null ? [] : local.m149["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m149["tags"], null) == null ? [] : local.m149["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m149["version_context"], null) == null ? [] : local.m149["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
