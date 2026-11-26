# Sample data source intersight_asset_device_contract_information — reads ../models/data_intersight_asset_device_contract_information.yml
locals { m095 = yamldecode(file("${path.module}/../models/data_intersight_asset_device_contract_information.yml"))["data_intersight_asset_device_contract_information"] }

data "intersight_asset_device_contract_information" "n095" {
  account_moid = try(local.m095["account_moid"], null)
  additional_properties = try(local.m095["additional_properties"], null)
  class_id = try(local.m095["class_id"], null)
  contract_status = try(local.m095["contract_status"], null)
  contract_status_reason = try(local.m095["contract_status_reason"], null)
  contract_unavailable_retry_count = try(local.m095["contract_unavailable_retry_count"], null)
  contract_updated_time = try(local.m095["contract_updated_time"], null)
  covered_product_line_end_date = try(local.m095["covered_product_line_end_date"], null)
  create_time = try(local.m095["create_time"], null)
  device_id = try(local.m095["device_id"], null)
  device_type = try(local.m095["device_type"], null)
  domain_group_moid = try(local.m095["domain_group_moid"], null)
  id = try(local.m095["id"], null)
  is_valid = try(local.m095["is_valid"], null)
  item_type = try(local.m095["item_type"], null)
  last_date_of_support = try(local.m095["last_date_of_support"], null)
  maintenance_purchase_order_number = try(local.m095["maintenance_purchase_order_number"], null)
  maintenance_sales_order_number = try(local.m095["maintenance_sales_order_number"], null)
  mod_time = try(local.m095["mod_time"], null)
  moid = try(local.m095["moid"], null)
  object_type = try(local.m095["object_type"], null)
  owners = try(local.m095["owners"], null)
  platform_type = try(local.m095["platform_type"], null)
  purchase_order_number = try(local.m095["purchase_order_number"], null)
  results = try(local.m095["results"], null)
  sales_order_number = try(local.m095["sales_order_number"], null)
  service_description = try(local.m095["service_description"], null)
  service_end_date = try(local.m095["service_end_date"], null)
  service_level = try(local.m095["service_level"], null)
  service_sku = try(local.m095["service_sku"], null)
  service_start_date = try(local.m095["service_start_date"], null)
  shared_scope = try(local.m095["shared_scope"], null)
  state_contract = try(local.m095["state_contract"], null)
  warranty_end_date = try(local.m095["warranty_end_date"], null)
  warranty_type = try(local.m095["warranty_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m095["ancestors"], null) == null ? [] : local.m095["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "contract" {
    for_each = try(local.m095["contract"], null) == null ? [] : local.m095["contract"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_customer" {
    for_each = try(local.m095["end_customer"], null) == null ? [] : local.m095["end_customer"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_user_global_ultimate" {
    for_each = try(local.m095["end_user_global_ultimate"], null) == null ? [] : local.m095["end_user_global_ultimate"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_source" {
    for_each = try(local.m095["nr_source"], null) == null ? [] : local.m095["nr_source"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m095["parent"], null) == null ? [] : local.m095["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m095["permission_resources"], null) == null ? [] : local.m095["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "product" {
    for_each = try(local.m095["product"], null) == null ? [] : local.m095["product"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m095["registered_device"], null) == null ? [] : local.m095["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reseller_global_ultimate" {
    for_each = try(local.m095["reseller_global_ultimate"], null) == null ? [] : local.m095["reseller_global_ultimate"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m095["tags"], null) == null ? [] : local.m095["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m095["version_context"], null) == null ? [] : local.m095["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
