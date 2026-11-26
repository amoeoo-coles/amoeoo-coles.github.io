# Sample data source intersight_niatelemetry_cloud_details — reads ../models/data_intersight_niatelemetry_cloud_details.yml
locals { m938 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_cloud_details.yml"))["data_intersight_niatelemetry_cloud_details"] }

data "intersight_niatelemetry_cloud_details" "n938" {
  account_moid = try(local.m938["account_moid"], null)
  additional_properties = try(local.m938["additional_properties"], null)
  class_id = try(local.m938["class_id"], null)
  create_time = try(local.m938["create_time"], null)
  dn = try(local.m938["dn"], null)
  domain_group_moid = try(local.m938["domain_group_moid"], null)
  id = try(local.m938["id"], null)
  mod_time = try(local.m938["mod_time"], null)
  moid = try(local.m938["moid"], null)
  object_type = try(local.m938["object_type"], null)
  owners = try(local.m938["owners"], null)
  record_type = try(local.m938["record_type"], null)
  record_version = try(local.m938["record_version"], null)
  results = try(local.m938["results"], null)
  shared_scope = try(local.m938["shared_scope"], null)
  site_name = try(local.m938["site_name"], null)
  vendor = try(local.m938["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m938["ancestors"], null) == null ? [] : local.m938["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m938["parent"], null) == null ? [] : local.m938["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m938["permission_resources"], null) == null ? [] : local.m938["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "region" {
    for_each = try(local.m938["region"], null) == null ? [] : local.m938["region"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m938["registered_device"], null) == null ? [] : local.m938["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m938["tags"], null) == null ? [] : local.m938["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m938["version_context"], null) == null ? [] : local.m938["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
