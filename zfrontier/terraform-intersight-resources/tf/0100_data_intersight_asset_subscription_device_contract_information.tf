# Sample data source intersight_asset_subscription_device_contract_information — reads ../models/data_intersight_asset_subscription_device_contract_information.yml
locals { m100 = yamldecode(file("${path.module}/../models/data_intersight_asset_subscription_device_contract_information.yml"))["data_intersight_asset_subscription_device_contract_information"] }

data "intersight_asset_subscription_device_contract_information" "n100" {
  account_moid = try(local.m100["account_moid"], null)
  additional_properties = try(local.m100["additional_properties"], null)
  class_id = try(local.m100["class_id"], null)
  create_time = try(local.m100["create_time"], null)
  device_id = try(local.m100["device_id"], null)
  device_pid = try(local.m100["device_pid"], null)
  domain_group_moid = try(local.m100["domain_group_moid"], null)
  id = try(local.m100["id"], null)
  mod_time = try(local.m100["mod_time"], null)
  moid = try(local.m100["moid"], null)
  object_type = try(local.m100["object_type"], null)
  owners = try(local.m100["owners"], null)
  results = try(local.m100["results"], null)
  shared_scope = try(local.m100["shared_scope"], null)
  subscription_ref_id = try(local.m100["subscription_ref_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m100["ancestors"], null) == null ? [] : local.m100["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_contract_information" {
    for_each = try(local.m100["device_contract_information"], null) == null ? [] : local.m100["device_contract_information"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_information" {
    for_each = try(local.m100["device_information"], null) == null ? [] : local.m100["device_information"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m100["parent"], null) == null ? [] : local.m100["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m100["permission_resources"], null) == null ? [] : local.m100["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m100["registered_device"], null) == null ? [] : local.m100["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m100["tags"], null) == null ? [] : local.m100["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m100["version_context"], null) == null ? [] : local.m100["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
