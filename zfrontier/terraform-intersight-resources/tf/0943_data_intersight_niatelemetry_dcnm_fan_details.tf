# Sample data source intersight_niatelemetry_dcnm_fan_details — reads ../models/data_intersight_niatelemetry_dcnm_fan_details.yml
locals { m943 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_dcnm_fan_details.yml"))["data_intersight_niatelemetry_dcnm_fan_details"] }

data "intersight_niatelemetry_dcnm_fan_details" "n943" {
  account_moid = try(local.m943["account_moid"], null)
  additional_properties = try(local.m943["additional_properties"], null)
  class_id = try(local.m943["class_id"], null)
  create_time = try(local.m943["create_time"], null)
  domain_group_moid = try(local.m943["domain_group_moid"], null)
  id = try(local.m943["id"], null)
  mod_time = try(local.m943["mod_time"], null)
  moid = try(local.m943["moid"], null)
  name = try(local.m943["name"], null)
  object_type = try(local.m943["object_type"], null)
  owners = try(local.m943["owners"], null)
  product_id = try(local.m943["product_id"], null)
  record_type = try(local.m943["record_type"], null)
  record_version = try(local.m943["record_version"], null)
  results = try(local.m943["results"], null)
  serial_number = try(local.m943["serial_number"], null)
  shared_scope = try(local.m943["shared_scope"], null)
  vendor_id = try(local.m943["vendor_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m943["ancestors"], null) == null ? [] : local.m943["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m943["parent"], null) == null ? [] : local.m943["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m943["permission_resources"], null) == null ? [] : local.m943["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m943["registered_device"], null) == null ? [] : local.m943["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m943["tags"], null) == null ? [] : local.m943["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m943["version_context"], null) == null ? [] : local.m943["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
