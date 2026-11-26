# Sample data source intersight_sdcard_policy — reads ../models/data_intersight_sdcard_policy.yml
locals { m1142 = yamldecode(file("${path.module}/../models/data_intersight_sdcard_policy.yml"))["data_intersight_sdcard_policy"] }

data "intersight_sdcard_policy" "n1142" {
  account_moid = try(local.m1142["account_moid"], null)
  additional_properties = try(local.m1142["additional_properties"], null)
  class_id = try(local.m1142["class_id"], null)
  create_time = try(local.m1142["create_time"], null)
  description = try(local.m1142["description"], null)
  domain_group_moid = try(local.m1142["domain_group_moid"], null)
  id = try(local.m1142["id"], null)
  mod_time = try(local.m1142["mod_time"], null)
  moid = try(local.m1142["moid"], null)
  name = try(local.m1142["name"], null)
  object_type = try(local.m1142["object_type"], null)
  owners = try(local.m1142["owners"], null)
  results = try(local.m1142["results"], null)
  shared_scope = try(local.m1142["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1142["ancestors"], null) == null ? [] : local.m1142["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1142["organization"], null) == null ? [] : local.m1142["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1142["parent"], null) == null ? [] : local.m1142["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "partitions" {
    for_each = try(local.m1142["partitions"], null) == null ? [] : local.m1142["partitions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1142["permission_resources"], null) == null ? [] : local.m1142["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m1142["profiles"], null) == null ? [] : local.m1142["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1142["tags"], null) == null ? [] : local.m1142["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1142["version_context"], null) == null ? [] : local.m1142["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
