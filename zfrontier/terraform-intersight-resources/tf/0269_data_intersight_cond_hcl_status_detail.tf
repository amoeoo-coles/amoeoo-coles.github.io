# Sample data source intersight_cond_hcl_status_detail — reads ../models/data_intersight_cond_hcl_status_detail.yml
locals { m269 = yamldecode(file("${path.module}/../models/data_intersight_cond_hcl_status_detail.yml"))["data_intersight_cond_hcl_status_detail"] }

data "intersight_cond_hcl_status_detail" "n269" {
  account_moid = try(local.m269["account_moid"], null)
  additional_properties = try(local.m269["additional_properties"], null)
  class_id = try(local.m269["class_id"], null)
  create_time = try(local.m269["create_time"], null)
  domain_group_moid = try(local.m269["domain_group_moid"], null)
  hardware_status = try(local.m269["hardware_status"], null)
  hcl_cimc_version = try(local.m269["hcl_cimc_version"], null)
  hcl_driver_name = try(local.m269["hcl_driver_name"], null)
  hcl_driver_version = try(local.m269["hcl_driver_version"], null)
  hcl_firmware_version = try(local.m269["hcl_firmware_version"], null)
  hcl_model = try(local.m269["hcl_model"], null)
  id = try(local.m269["id"], null)
  inv_cimc_version = try(local.m269["inv_cimc_version"], null)
  inv_driver_name = try(local.m269["inv_driver_name"], null)
  inv_driver_version = try(local.m269["inv_driver_version"], null)
  inv_firmware_version = try(local.m269["inv_firmware_version"], null)
  inv_model = try(local.m269["inv_model"], null)
  inv_vendor = try(local.m269["inv_vendor"], null)
  mod_time = try(local.m269["mod_time"], null)
  moid = try(local.m269["moid"], null)
  object_type = try(local.m269["object_type"], null)
  owners = try(local.m269["owners"], null)
  reason = try(local.m269["reason"], null)
  results = try(local.m269["results"], null)
  shared_scope = try(local.m269["shared_scope"], null)
  software_status = try(local.m269["software_status"], null)
  status = try(local.m269["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m269["ancestors"], null) == null ? [] : local.m269["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "component" {
    for_each = try(local.m269["component"], null) == null ? [] : local.m269["component"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hcl_status" {
    for_each = try(local.m269["hcl_status"], null) == null ? [] : local.m269["hcl_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m269["parent"], null) == null ? [] : local.m269["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m269["permission_resources"], null) == null ? [] : local.m269["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m269["tags"], null) == null ? [] : local.m269["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m269["version_context"], null) == null ? [] : local.m269["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
