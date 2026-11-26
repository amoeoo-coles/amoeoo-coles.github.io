# Sample data source intersight_iaas_device_status — reads ../models/data_intersight_iaas_device_status.yml
locals { m647 = yamldecode(file("${path.module}/../models/data_intersight_iaas_device_status.yml"))["data_intersight_iaas_device_status"] }

data "intersight_iaas_device_status" "n647" {
  account_moid = try(local.m647["account_moid"], null)
  account_name = try(local.m647["account_name"], null)
  account_type = try(local.m647["account_type"], null)
  additional_properties = try(local.m647["additional_properties"], null)
  category = try(local.m647["category"], null)
  claim_status = try(local.m647["claim_status"], null)
  class_id = try(local.m647["class_id"], null)
  connection_status = try(local.m647["connection_status"], null)
  create_time = try(local.m647["create_time"], null)
  device_model = try(local.m647["device_model"], null)
  device_vendor = try(local.m647["device_vendor"], null)
  device_version = try(local.m647["device_version"], null)
  domain_group_moid = try(local.m647["domain_group_moid"], null)
  id = try(local.m647["id"], null)
  ip_address = try(local.m647["ip_address"], null)
  mod_time = try(local.m647["mod_time"], null)
  moid = try(local.m647["moid"], null)
  object_type = try(local.m647["object_type"], null)
  owners = try(local.m647["owners"], null)
  pod = try(local.m647["pod"], null)
  pod_type = try(local.m647["pod_type"], null)
  results = try(local.m647["results"], null)
  shared_scope = try(local.m647["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m647["ancestors"], null) == null ? [] : local.m647["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "guid" {
    for_each = try(local.m647["guid"], null) == null ? [] : local.m647["guid"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m647["parent"], null) == null ? [] : local.m647["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m647["permission_resources"], null) == null ? [] : local.m647["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m647["tags"], null) == null ? [] : local.m647["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m647["version_context"], null) == null ? [] : local.m647["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
