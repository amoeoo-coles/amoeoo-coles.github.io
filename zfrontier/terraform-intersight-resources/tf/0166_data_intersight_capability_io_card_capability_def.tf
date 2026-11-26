# Sample data source intersight_capability_io_card_capability_def — reads ../models/data_intersight_capability_io_card_capability_def.yml
locals { m166 = yamldecode(file("${path.module}/../models/data_intersight_capability_io_card_capability_def.yml"))["data_intersight_capability_io_card_capability_def"] }

data "intersight_capability_io_card_capability_def" "n166" {
  account_moid = try(local.m166["account_moid"], null)
  additional_properties = try(local.m166["additional_properties"], null)
  class_id = try(local.m166["class_id"], null)
  create_time = try(local.m166["create_time"], null)
  dc_supported = try(local.m166["dc_supported"], null)
  domain_group_moid = try(local.m166["domain_group_moid"], null)
  id = try(local.m166["id"], null)
  mod_time = try(local.m166["mod_time"], null)
  moid = try(local.m166["moid"], null)
  name = try(local.m166["name"], null)
  object_type = try(local.m166["object_type"], null)
  owners = try(local.m166["owners"], null)
  results = try(local.m166["results"], null)
  shared_scope = try(local.m166["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m166["ancestors"], null) == null ? [] : local.m166["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m166["parent"], null) == null ? [] : local.m166["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m166["permission_resources"], null) == null ? [] : local.m166["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m166["tags"], null) == null ? [] : local.m166["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m166["version_context"], null) == null ? [] : local.m166["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
