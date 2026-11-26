# Sample data source intersight_cond_hcl_status — reads ../models/data_intersight_cond_hcl_status.yml
locals { m268 = yamldecode(file("${path.module}/../models/data_intersight_cond_hcl_status.yml"))["data_intersight_cond_hcl_status"] }

data "intersight_cond_hcl_status" "n268" {
  account_moid = try(local.m268["account_moid"], null)
  additional_properties = try(local.m268["additional_properties"], null)
  class_id = try(local.m268["class_id"], null)
  component_status = try(local.m268["component_status"], null)
  create_time = try(local.m268["create_time"], null)
  domain_group_moid = try(local.m268["domain_group_moid"], null)
  generation = try(local.m268["generation"], null)
  hardware_status = try(local.m268["hardware_status"], null)
  hcl_firmware_version = try(local.m268["hcl_firmware_version"], null)
  hcl_model = try(local.m268["hcl_model"], null)
  hcl_os_vendor = try(local.m268["hcl_os_vendor"], null)
  hcl_os_version = try(local.m268["hcl_os_version"], null)
  hcl_processor = try(local.m268["hcl_processor"], null)
  hcl_validation_time = try(local.m268["hcl_validation_time"], null)
  id = try(local.m268["id"], null)
  inv_firmware_version = try(local.m268["inv_firmware_version"], null)
  inv_model = try(local.m268["inv_model"], null)
  inv_os_vendor = try(local.m268["inv_os_vendor"], null)
  inv_os_version = try(local.m268["inv_os_version"], null)
  inv_processor = try(local.m268["inv_processor"], null)
  management_mode = try(local.m268["management_mode"], null)
  mod_time = try(local.m268["mod_time"], null)
  moid = try(local.m268["moid"], null)
  object_type = try(local.m268["object_type"], null)
  owners = try(local.m268["owners"], null)
  personality = try(local.m268["personality"], null)
  reason = try(local.m268["reason"], null)
  results = try(local.m268["results"], null)
  server_name = try(local.m268["server_name"], null)
  server_reason = try(local.m268["server_reason"], null)
  shared_scope = try(local.m268["shared_scope"], null)
  software_status = try(local.m268["software_status"], null)
  status = try(local.m268["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m268["ancestors"], null) == null ? [] : local.m268["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "details" {
    for_each = try(local.m268["details"], null) == null ? [] : local.m268["details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "managed_object" {
    for_each = try(local.m268["managed_object"], null) == null ? [] : local.m268["managed_object"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m268["parent"], null) == null ? [] : local.m268["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m268["permission_resources"], null) == null ? [] : local.m268["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m268["registered_device"], null) == null ? [] : local.m268["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m268["tags"], null) == null ? [] : local.m268["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m268["version_context"], null) == null ? [] : local.m268["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
