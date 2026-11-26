# Sample data source intersight_niatelemetry_dom_info_object — reads ../models/data_intersight_niatelemetry_dom_info_object.yml
locals { m948 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_dom_info_object.yml"))["data_intersight_niatelemetry_dom_info_object"] }

data "intersight_niatelemetry_dom_info_object" "n948" {
  account_moid = try(local.m948["account_moid"], null)
  additional_properties = try(local.m948["additional_properties"], null)
  class_id = try(local.m948["class_id"], null)
  collection_id = try(local.m948["collection_id"], null)
  create_time = try(local.m948["create_time"], null)
  domain_group_moid = try(local.m948["domain_group_moid"], null)
  id = try(local.m948["id"], null)
  mod_time = try(local.m948["mod_time"], null)
  moid = try(local.m948["moid"], null)
  object_type = try(local.m948["object_type"], null)
  owners = try(local.m948["owners"], null)
  record_type = try(local.m948["record_type"], null)
  record_version = try(local.m948["record_version"], null)
  results = try(local.m948["results"], null)
  serial = try(local.m948["serial"], null)
  shared_scope = try(local.m948["shared_scope"], null)
  slot_id = try(local.m948["slot_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m948["ancestors"], null) == null ? [] : local.m948["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "dom_info" {
    for_each = try(local.m948["dom_info"], null) == null ? [] : local.m948["dom_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m948["parent"], null) == null ? [] : local.m948["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m948["permission_resources"], null) == null ? [] : local.m948["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m948["registered_device"], null) == null ? [] : local.m948["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m948["tags"], null) == null ? [] : local.m948["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m948["version_context"], null) == null ? [] : local.m948["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
