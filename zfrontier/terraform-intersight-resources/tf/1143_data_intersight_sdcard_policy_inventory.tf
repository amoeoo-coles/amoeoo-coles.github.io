# Sample data source intersight_sdcard_policy_inventory — reads ../models/data_intersight_sdcard_policy_inventory.yml
locals { m1143 = yamldecode(file("${path.module}/../models/data_intersight_sdcard_policy_inventory.yml"))["data_intersight_sdcard_policy_inventory"] }

data "intersight_sdcard_policy_inventory" "n1143" {
  account_moid = try(local.m1143["account_moid"], null)
  additional_properties = try(local.m1143["additional_properties"], null)
  class_id = try(local.m1143["class_id"], null)
  create_time = try(local.m1143["create_time"], null)
  description = try(local.m1143["description"], null)
  device_mo_id = try(local.m1143["device_mo_id"], null)
  domain_group_moid = try(local.m1143["domain_group_moid"], null)
  id = try(local.m1143["id"], null)
  mod_time = try(local.m1143["mod_time"], null)
  moid = try(local.m1143["moid"], null)
  name = try(local.m1143["name"], null)
  object_type = try(local.m1143["object_type"], null)
  owners = try(local.m1143["owners"], null)
  results = try(local.m1143["results"], null)
  shared_scope = try(local.m1143["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1143["ancestors"], null) == null ? [] : local.m1143["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1143["parent"], null) == null ? [] : local.m1143["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "partitions" {
    for_each = try(local.m1143["partitions"], null) == null ? [] : local.m1143["partitions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1143["permission_resources"], null) == null ? [] : local.m1143["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1143["tags"], null) == null ? [] : local.m1143["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1143["target_mo"], null) == null ? [] : local.m1143["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1143["version_context"], null) == null ? [] : local.m1143["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
