# Sample data source intersight_capability_cimc_firmware_descriptor — reads ../models/data_intersight_capability_cimc_firmware_descriptor.yml
locals { m151 = yamldecode(file("${path.module}/../models/data_intersight_capability_cimc_firmware_descriptor.yml"))["data_intersight_capability_cimc_firmware_descriptor"] }

data "intersight_capability_cimc_firmware_descriptor" "n151" {
  account_moid = try(local.m151["account_moid"], null)
  adapter_ep_proxy_enabled = try(local.m151["adapter_ep_proxy_enabled"], null)
  additional_properties = try(local.m151["additional_properties"], null)
  class_id = try(local.m151["class_id"], null)
  create_time = try(local.m151["create_time"], null)
  description = try(local.m151["description"], null)
  domain_group_moid = try(local.m151["domain_group_moid"], null)
  id = try(local.m151["id"], null)
  local_user_pswd_supported_ver = try(local.m151["local_user_pswd_supported_ver"], null)
  mod_time = try(local.m151["mod_time"], null)
  model = try(local.m151["model"], null)
  moid = try(local.m151["moid"], null)
  nr_version = try(local.m151["nr_version"], null)
  object_type = try(local.m151["object_type"], null)
  owners = try(local.m151["owners"], null)
  policy_profile_supported_version = try(local.m151["policy_profile_supported_version"], null)
  results = try(local.m151["results"], null)
  revision = try(local.m151["revision"], null)
  shared_scope = try(local.m151["shared_scope"], null)
  uuid_supported_ver = try(local.m151["uuid_supported_ver"], null)
  vendor = try(local.m151["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m151["ancestors"], null) == null ? [] : local.m151["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m151["capabilities"], null) == null ? [] : local.m151["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m151["parent"], null) == null ? [] : local.m151["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m151["permission_resources"], null) == null ? [] : local.m151["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m151["tags"], null) == null ? [] : local.m151["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m151["version_context"], null) == null ? [] : local.m151["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
