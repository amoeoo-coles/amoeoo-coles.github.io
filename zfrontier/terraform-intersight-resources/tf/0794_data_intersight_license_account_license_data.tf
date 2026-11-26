# Sample data source intersight_license_account_license_data — reads ../models/data_intersight_license_account_license_data.yml
locals { m794 = yamldecode(file("${path.module}/../models/data_intersight_license_account_license_data.yml"))["data_intersight_license_account_license_data"] }

data "intersight_license_account_license_data" "n794" {
  account_id = try(local.m794["account_id"], null)
  account_moid = try(local.m794["account_moid"], null)
  additional_properties = try(local.m794["additional_properties"], null)
  auth_expire_time = try(local.m794["auth_expire_time"], null)
  auth_initial_time = try(local.m794["auth_initial_time"], null)
  auth_next_time = try(local.m794["auth_next_time"], null)
  category = try(local.m794["category"], null)
  class_id = try(local.m794["class_id"], null)
  create_time = try(local.m794["create_time"], null)
  default_license_type = try(local.m794["default_license_type"], null)
  default_license_type_newer_models = try(local.m794["default_license_type_newer_models"], null)
  domain_group_moid = try(local.m794["domain_group_moid"], null)
  error_desc = try(local.m794["error_desc"], null)
  group = try(local.m794["group"], null)
  highest_compliant_license_tier = try(local.m794["highest_compliant_license_tier"], null)
  id = try(local.m794["id"], null)
  last_cssm_sync = try(local.m794["last_cssm_sync"], null)
  last_renew = try(local.m794["last_renew"], null)
  last_sync = try(local.m794["last_sync"], null)
  last_updated_time = try(local.m794["last_updated_time"], null)
  license_state = try(local.m794["license_state"], null)
  license_tech_support_info = try(local.m794["license_tech_support_info"], null)
  mod_time = try(local.m794["mod_time"], null)
  moid = try(local.m794["moid"], null)
  object_type = try(local.m794["object_type"], null)
  owners = try(local.m794["owners"], null)
  register_expire_time = try(local.m794["register_expire_time"], null)
  register_initial_time = try(local.m794["register_initial_time"], null)
  register_next_time = try(local.m794["register_next_time"], null)
  registration_status = try(local.m794["registration_status"], null)
  renew_failure_string = try(local.m794["renew_failure_string"], null)
  results = try(local.m794["results"], null)
  shared_scope = try(local.m794["shared_scope"], null)
  smart_account = try(local.m794["smart_account"], null)
  smart_account_domain = try(local.m794["smart_account_domain"], null)
  smart_api_enabled = try(local.m794["smart_api_enabled"], null)
  smart_api_sync_status = try(local.m794["smart_api_sync_status"], null)
  sync_status = try(local.m794["sync_status"], null)
  virtual_account = try(local.m794["virtual_account"], null)
  dynamic "account" {
    for_each = try(local.m794["account"], null) == null ? [] : local.m794["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m794["ancestors"], null) == null ? [] : local.m794["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "customer_op" {
    for_each = try(local.m794["customer_op"], null) == null ? [] : local.m794["customer_op"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "erp_customer_op" {
    for_each = try(local.m794["erp_customer_op"], null) == null ? [] : local.m794["erp_customer_op"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "erp_license_count" {
    for_each = try(local.m794["erp_license_count"], null) == null ? [] : local.m794["erp_license_count"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iks_customer_op" {
    for_each = try(local.m794["iks_customer_op"], null) == null ? [] : local.m794["iks_customer_op"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iks_license_count" {
    for_each = try(local.m794["iks_license_count"], null) == null ? [] : local.m794["iks_license_count"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inc_customer_op" {
    for_each = try(local.m794["inc_customer_op"], null) == null ? [] : local.m794["inc_customer_op"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inc_license_count" {
    for_each = try(local.m794["inc_license_count"], null) == null ? [] : local.m794["inc_license_count"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iwo_customer_op" {
    for_each = try(local.m794["iwo_customer_op"], null) == null ? [] : local.m794["iwo_customer_op"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iwo_license_count" {
    for_each = try(local.m794["iwo_license_count"], null) == null ? [] : local.m794["iwo_license_count"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "license_info_view" {
    for_each = try(local.m794["license_info_view"], null) == null ? [] : local.m794["license_info_view"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "license_registration_status" {
    for_each = try(local.m794["license_registration_status"], null) == null ? [] : local.m794["license_registration_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "licenseinfos" {
    for_each = try(local.m794["licenseinfos"], null) == null ? [] : local.m794["licenseinfos"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m794["parent"], null) == null ? [] : local.m794["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m794["permission_resources"], null) == null ? [] : local.m794["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "smartlicense_token" {
    for_each = try(local.m794["smartlicense_token"], null) == null ? [] : local.m794["smartlicense_token"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m794["tags"], null) == null ? [] : local.m794["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m794["version_context"], null) == null ? [] : local.m794["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
