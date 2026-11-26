# Sample data source intersight_niatelemetry_dcnm_fex_details — reads ../models/data_intersight_niatelemetry_dcnm_fex_details.yml
locals { m944 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_dcnm_fex_details.yml"))["data_intersight_niatelemetry_dcnm_fex_details"] }

data "intersight_niatelemetry_dcnm_fex_details" "n944" {
  account_moid = try(local.m944["account_moid"], null)
  additional_properties = try(local.m944["additional_properties"], null)
  class_id = try(local.m944["class_id"], null)
  create_time = try(local.m944["create_time"], null)
  domain_group_moid = try(local.m944["domain_group_moid"], null)
  id = try(local.m944["id"], null)
  mod_time = try(local.m944["mod_time"], null)
  moid = try(local.m944["moid"], null)
  name = try(local.m944["name"], null)
  object_type = try(local.m944["object_type"], null)
  owners = try(local.m944["owners"], null)
  product_id = try(local.m944["product_id"], null)
  record_type = try(local.m944["record_type"], null)
  record_version = try(local.m944["record_version"], null)
  results = try(local.m944["results"], null)
  serial_number = try(local.m944["serial_number"], null)
  shared_scope = try(local.m944["shared_scope"], null)
  vendor_id = try(local.m944["vendor_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m944["ancestors"], null) == null ? [] : local.m944["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m944["parent"], null) == null ? [] : local.m944["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m944["permission_resources"], null) == null ? [] : local.m944["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m944["registered_device"], null) == null ? [] : local.m944["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m944["tags"], null) == null ? [] : local.m944["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m944["version_context"], null) == null ? [] : local.m944["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
