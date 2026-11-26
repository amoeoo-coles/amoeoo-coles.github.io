# Sample data source intersight_asset_deployment_device — reads ../models/data_intersight_asset_deployment_device.yml
locals { m092 = yamldecode(file("${path.module}/../models/data_intersight_asset_deployment_device.yml"))["data_intersight_asset_deployment_device"] }

data "intersight_asset_deployment_device" "n092" {
  account_moid = try(local.m092["account_moid"], null)
  additional_properties = try(local.m092["additional_properties"], null)
  class_id = try(local.m092["class_id"], null)
  create_time = try(local.m092["create_time"], null)
  device_id = try(local.m092["device_id"], null)
  device_pid = try(local.m092["device_pid"], null)
  domain_group_moid = try(local.m092["domain_group_moid"], null)
  id = try(local.m092["id"], null)
  mod_time = try(local.m092["mod_time"], null)
  moid = try(local.m092["moid"], null)
  object_type = try(local.m092["object_type"], null)
  owners = try(local.m092["owners"], null)
  product_subgroup = try(local.m092["product_subgroup"], null)
  product_type = try(local.m092["product_type"], null)
  registered_device_moid = try(local.m092["registered_device_moid"], null)
  results = try(local.m092["results"], null)
  shared_scope = try(local.m092["shared_scope"], null)
  virtualization_platform = try(local.m092["virtualization_platform"], null)
  workload = try(local.m092["workload"], null)
  dynamic "alarm_info" {
    for_each = try(local.m092["alarm_info"], null) == null ? [] : local.m092["alarm_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m092["ancestors"], null) == null ? [] : local.m092["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "deployment" {
    for_each = try(local.m092["deployment"], null) == null ? [] : local.m092["deployment"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_contract_information" {
    for_each = try(local.m092["device_contract_information"], null) == null ? [] : local.m092["device_contract_information"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_information" {
    for_each = try(local.m092["device_information"], null) == null ? [] : local.m092["device_information"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_statistics" {
    for_each = try(local.m092["device_statistics"], null) == null ? [] : local.m092["device_statistics"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m092["parent"], null) == null ? [] : local.m092["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m092["permission_resources"], null) == null ? [] : local.m092["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m092["registered_device"], null) == null ? [] : local.m092["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "subscription" {
    for_each = try(local.m092["subscription"], null) == null ? [] : local.m092["subscription"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "subscription_account" {
    for_each = try(local.m092["subscription_account"], null) == null ? [] : local.m092["subscription_account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m092["tags"], null) == null ? [] : local.m092["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "unit_of_measure" {
    for_each = try(local.m092["unit_of_measure"], null) == null ? [] : local.m092["unit_of_measure"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m092["version_context"], null) == null ? [] : local.m092["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
