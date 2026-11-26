# Sample data source intersight_capability_adapter_firmware_requirement — reads ../models/data_intersight_capability_adapter_firmware_requirement.yml
locals { m142 = yamldecode(file("${path.module}/../models/data_intersight_capability_adapter_firmware_requirement.yml"))["data_intersight_capability_adapter_firmware_requirement"] }

data "intersight_capability_adapter_firmware_requirement" "n142" {
  account_moid = try(local.m142["account_moid"], null)
  adapter_series = try(local.m142["adapter_series"], null)
  additional_properties = try(local.m142["additional_properties"], null)
  class_id = try(local.m142["class_id"], null)
  create_time = try(local.m142["create_time"], null)
  domain_group_moid = try(local.m142["domain_group_moid"], null)
  id = try(local.m142["id"], null)
  ignore_empty_current_version = try(local.m142["ignore_empty_current_version"], null)
  minimum_adapter_version = try(local.m142["minimum_adapter_version"], null)
  minimum_bmc_version = try(local.m142["minimum_bmc_version"], null)
  mod_time = try(local.m142["mod_time"], null)
  moid = try(local.m142["moid"], null)
  name = try(local.m142["name"], null)
  object_type = try(local.m142["object_type"], null)
  owners = try(local.m142["owners"], null)
  recommended_bmc_version = try(local.m142["recommended_bmc_version"], null)
  results = try(local.m142["results"], null)
  shared_scope = try(local.m142["shared_scope"], null)
  supported_models = try(local.m142["supported_models"], null)
  dynamic "ancestors" {
    for_each = try(local.m142["ancestors"], null) == null ? [] : local.m142["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m142["parent"], null) == null ? [] : local.m142["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m142["permission_resources"], null) == null ? [] : local.m142["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m142["tags"], null) == null ? [] : local.m142["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m142["version_context"], null) == null ? [] : local.m142["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
