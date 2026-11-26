# Sample data source intersight_capability_io_card_manufacturing_def — reads ../models/data_intersight_capability_io_card_manufacturing_def.yml
locals { m168 = yamldecode(file("${path.module}/../models/data_intersight_capability_io_card_manufacturing_def.yml"))["data_intersight_capability_io_card_manufacturing_def"] }

data "intersight_capability_io_card_manufacturing_def" "n168" {
  account_moid = try(local.m168["account_moid"], null)
  additional_properties = try(local.m168["additional_properties"], null)
  caption = try(local.m168["caption"], null)
  class_id = try(local.m168["class_id"], null)
  create_time = try(local.m168["create_time"], null)
  description = try(local.m168["description"], null)
  domain_group_moid = try(local.m168["domain_group_moid"], null)
  id = try(local.m168["id"], null)
  mod_time = try(local.m168["mod_time"], null)
  moid = try(local.m168["moid"], null)
  name = try(local.m168["name"], null)
  object_type = try(local.m168["object_type"], null)
  owners = try(local.m168["owners"], null)
  pid = try(local.m168["pid"], null)
  product_name = try(local.m168["product_name"], null)
  results = try(local.m168["results"], null)
  shared_scope = try(local.m168["shared_scope"], null)
  sku = try(local.m168["sku"], null)
  vid = try(local.m168["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m168["ancestors"], null) == null ? [] : local.m168["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m168["parent"], null) == null ? [] : local.m168["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m168["permission_resources"], null) == null ? [] : local.m168["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m168["tags"], null) == null ? [] : local.m168["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m168["version_context"], null) == null ? [] : local.m168["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
