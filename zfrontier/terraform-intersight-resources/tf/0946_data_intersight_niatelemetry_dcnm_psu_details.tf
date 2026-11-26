# Sample data source intersight_niatelemetry_dcnm_psu_details — reads ../models/data_intersight_niatelemetry_dcnm_psu_details.yml
locals { m946 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_dcnm_psu_details.yml"))["data_intersight_niatelemetry_dcnm_psu_details"] }

data "intersight_niatelemetry_dcnm_psu_details" "n946" {
  account_moid = try(local.m946["account_moid"], null)
  additional_properties = try(local.m946["additional_properties"], null)
  class_id = try(local.m946["class_id"], null)
  create_time = try(local.m946["create_time"], null)
  domain_group_moid = try(local.m946["domain_group_moid"], null)
  id = try(local.m946["id"], null)
  mod_time = try(local.m946["mod_time"], null)
  moid = try(local.m946["moid"], null)
  name = try(local.m946["name"], null)
  object_type = try(local.m946["object_type"], null)
  owners = try(local.m946["owners"], null)
  product_id = try(local.m946["product_id"], null)
  record_type = try(local.m946["record_type"], null)
  record_version = try(local.m946["record_version"], null)
  results = try(local.m946["results"], null)
  serial_number = try(local.m946["serial_number"], null)
  shared_scope = try(local.m946["shared_scope"], null)
  vendor_id = try(local.m946["vendor_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m946["ancestors"], null) == null ? [] : local.m946["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m946["parent"], null) == null ? [] : local.m946["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m946["permission_resources"], null) == null ? [] : local.m946["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m946["registered_device"], null) == null ? [] : local.m946["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m946["tags"], null) == null ? [] : local.m946["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m946["version_context"], null) == null ? [] : local.m946["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
