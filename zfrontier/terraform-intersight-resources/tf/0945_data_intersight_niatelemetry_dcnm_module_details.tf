# Sample data source intersight_niatelemetry_dcnm_module_details — reads ../models/data_intersight_niatelemetry_dcnm_module_details.yml
locals { m945 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_dcnm_module_details.yml"))["data_intersight_niatelemetry_dcnm_module_details"] }

data "intersight_niatelemetry_dcnm_module_details" "n945" {
  account_moid = try(local.m945["account_moid"], null)
  additional_properties = try(local.m945["additional_properties"], null)
  class_id = try(local.m945["class_id"], null)
  create_time = try(local.m945["create_time"], null)
  domain_group_moid = try(local.m945["domain_group_moid"], null)
  id = try(local.m945["id"], null)
  mod_time = try(local.m945["mod_time"], null)
  moid = try(local.m945["moid"], null)
  name = try(local.m945["name"], null)
  object_type = try(local.m945["object_type"], null)
  owners = try(local.m945["owners"], null)
  product_id = try(local.m945["product_id"], null)
  record_type = try(local.m945["record_type"], null)
  record_version = try(local.m945["record_version"], null)
  results = try(local.m945["results"], null)
  serial_number = try(local.m945["serial_number"], null)
  shared_scope = try(local.m945["shared_scope"], null)
  vendor_id = try(local.m945["vendor_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m945["ancestors"], null) == null ? [] : local.m945["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m945["parent"], null) == null ? [] : local.m945["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m945["permission_resources"], null) == null ? [] : local.m945["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m945["registered_device"], null) == null ? [] : local.m945["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m945["tags"], null) == null ? [] : local.m945["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m945["version_context"], null) == null ? [] : local.m945["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
