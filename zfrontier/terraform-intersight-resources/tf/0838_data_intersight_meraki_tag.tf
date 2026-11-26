# Sample data source intersight_meraki_tag — reads ../models/data_intersight_meraki_tag.yml
locals { m838 = yamldecode(file("${path.module}/../models/data_intersight_meraki_tag.yml"))["data_intersight_meraki_tag"] }

data "intersight_meraki_tag" "n838" {
  account_moid = try(local.m838["account_moid"], null)
  additional_properties = try(local.m838["additional_properties"], null)
  class_id = try(local.m838["class_id"], null)
  create_time = try(local.m838["create_time"], null)
  domain_group_moid = try(local.m838["domain_group_moid"], null)
  id = try(local.m838["id"], null)
  mod_time = try(local.m838["mod_time"], null)
  moid = try(local.m838["moid"], null)
  name = try(local.m838["name"], null)
  object_type = try(local.m838["object_type"], null)
  owners = try(local.m838["owners"], null)
  results = try(local.m838["results"], null)
  shared_scope = try(local.m838["shared_scope"], null)
  type = try(local.m838["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m838["ancestors"], null) == null ? [] : local.m838["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device" {
    for_each = try(local.m838["device"], null) == null ? [] : local.m838["device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network" {
    for_each = try(local.m838["network"], null) == null ? [] : local.m838["network"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m838["parent"], null) == null ? [] : local.m838["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m838["permission_resources"], null) == null ? [] : local.m838["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m838["registered_device"], null) == null ? [] : local.m838["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m838["tags"], null) == null ? [] : local.m838["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m838["version_context"], null) == null ? [] : local.m838["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
