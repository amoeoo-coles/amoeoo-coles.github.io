# Sample data source intersight_niatelemetry_dom_thres_info_object — reads ../models/data_intersight_niatelemetry_dom_thres_info_object.yml
locals { m949 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_dom_thres_info_object.yml"))["data_intersight_niatelemetry_dom_thres_info_object"] }

data "intersight_niatelemetry_dom_thres_info_object" "n949" {
  account_moid = try(local.m949["account_moid"], null)
  additional_properties = try(local.m949["additional_properties"], null)
  class_id = try(local.m949["class_id"], null)
  create_time = try(local.m949["create_time"], null)
  domain_group_moid = try(local.m949["domain_group_moid"], null)
  id = try(local.m949["id"], null)
  mod_time = try(local.m949["mod_time"], null)
  moid = try(local.m949["moid"], null)
  object_type = try(local.m949["object_type"], null)
  owners = try(local.m949["owners"], null)
  record_type = try(local.m949["record_type"], null)
  record_version = try(local.m949["record_version"], null)
  results = try(local.m949["results"], null)
  serial = try(local.m949["serial"], null)
  shared_scope = try(local.m949["shared_scope"], null)
  slot_id = try(local.m949["slot_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m949["ancestors"], null) == null ? [] : local.m949["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "dom_thres_info" {
    for_each = try(local.m949["dom_thres_info"], null) == null ? [] : local.m949["dom_thres_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m949["parent"], null) == null ? [] : local.m949["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m949["permission_resources"], null) == null ? [] : local.m949["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m949["registered_device"], null) == null ? [] : local.m949["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m949["tags"], null) == null ? [] : local.m949["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m949["version_context"], null) == null ? [] : local.m949["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
