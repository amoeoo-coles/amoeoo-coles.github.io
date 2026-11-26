# Sample data source intersight_capability_vic_descriptor — reads ../models/data_intersight_capability_vic_descriptor.yml
locals { m197 = yamldecode(file("${path.module}/../models/data_intersight_capability_vic_descriptor.yml"))["data_intersight_capability_vic_descriptor"] }

data "intersight_capability_vic_descriptor" "n197" {
  account_moid = try(local.m197["account_moid"], null)
  additional_properties = try(local.m197["additional_properties"], null)
  class_id = try(local.m197["class_id"], null)
  create_time = try(local.m197["create_time"], null)
  domain_group_moid = try(local.m197["domain_group_moid"], null)
  id = try(local.m197["id"], null)
  mod_time = try(local.m197["mod_time"], null)
  model = try(local.m197["model"], null)
  moid = try(local.m197["moid"], null)
  name = try(local.m197["name"], null)
  object_type = try(local.m197["object_type"], null)
  owners = try(local.m197["owners"], null)
  results = try(local.m197["results"], null)
  shared_scope = try(local.m197["shared_scope"], null)
  vic_id = try(local.m197["vic_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m197["ancestors"], null) == null ? [] : local.m197["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m197["parent"], null) == null ? [] : local.m197["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m197["permission_resources"], null) == null ? [] : local.m197["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m197["tags"], null) == null ? [] : local.m197["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m197["version_context"], null) == null ? [] : local.m197["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
