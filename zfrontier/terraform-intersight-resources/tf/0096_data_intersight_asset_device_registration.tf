# Sample data source intersight_asset_device_registration — reads ../models/data_intersight_asset_device_registration.yml
locals { m096 = yamldecode(file("${path.module}/../models/data_intersight_asset_device_registration.yml"))["data_intersight_asset_device_registration"] }

data "intersight_asset_device_registration" "n096" {
  access_key_id = try(local.m096["access_key_id"], null)
  account_moid = try(local.m096["account_moid"], null)
  additional_properties = try(local.m096["additional_properties"], null)
  api_version = try(local.m096["api_version"], null)
  app_partition_number = try(local.m096["app_partition_number"], null)
  claimed_by_user_name = try(local.m096["claimed_by_user_name"], null)
  claimed_time = try(local.m096["claimed_time"], null)
  class_id = try(local.m096["class_id"], null)
  connection_id = try(local.m096["connection_id"], null)
  connection_reason = try(local.m096["connection_reason"], null)
  connection_status = try(local.m096["connection_status"], null)
  connection_status_last_change_time = try(local.m096["connection_status_last_change_time"], null)
  connector_version = try(local.m096["connector_version"], null)
  create_time = try(local.m096["create_time"], null)
  device_external_ip_address = try(local.m096["device_external_ip_address"], null)
  device_hostname = try(local.m096["device_hostname"], null)
  device_ip_address = try(local.m096["device_ip_address"], null)
  domain_group_moid = try(local.m096["domain_group_moid"], null)
  execution_mode = try(local.m096["execution_mode"], null)
  id = try(local.m096["id"], null)
  mod_time = try(local.m096["mod_time"], null)
  moid = try(local.m096["moid"], null)
  object_type = try(local.m096["object_type"], null)
  owners = try(local.m096["owners"], null)
  pid = try(local.m096["pid"], null)
  platform_type = try(local.m096["platform_type"], null)
  proxy_app = try(local.m096["proxy_app"], null)
  public_access_key = try(var.secrets["data_intersight_asset_device_registration.public_access_key"], local.m096["public_access_key"])
  public_access_key_rotated = try(local.m096["public_access_key_rotated"], null)
  public_encryption_key = try(var.secrets["data_intersight_asset_device_registration.public_encryption_key"], local.m096["public_encryption_key"])
  read_only = try(local.m096["read_only"], null)
  results = try(local.m096["results"], null)
  rotate_access_key = try(var.secrets["data_intersight_asset_device_registration.rotate_access_key"], local.m096["rotate_access_key"])
  serial = try(local.m096["serial"], null)
  shared_scope = try(local.m096["shared_scope"], null)
  vendor = try(local.m096["vendor"], null)
  dynamic "account" {
    for_each = try(local.m096["account"], null) == null ? [] : local.m096["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m096["ancestors"], null) == null ? [] : local.m096["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "claimed_by_user" {
    for_each = try(local.m096["claimed_by_user"], null) == null ? [] : local.m096["claimed_by_user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_members" {
    for_each = try(local.m096["cluster_members"], null) == null ? [] : local.m096["cluster_members"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "custom_permission_resources" {
    for_each = try(local.m096["custom_permission_resources"], null) == null ? [] : local.m096["custom_permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_claim" {
    for_each = try(local.m096["device_claim"], null) == null ? [] : local.m096["device_claim"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_configuration" {
    for_each = try(local.m096["device_configuration"], null) == null ? [] : local.m096["device_configuration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "domain_group" {
    for_each = try(local.m096["domain_group"], null) == null ? [] : local.m096["domain_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m096["parent"], null) == null ? [] : local.m096["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent_connection" {
    for_each = try(local.m096["parent_connection"], null) == null ? [] : local.m096["parent_connection"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent_signature" {
    for_each = try(local.m096["parent_signature"], null) == null ? [] : local.m096["parent_signature"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m096["permission_resources"], null) == null ? [] : local.m096["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m096["tags"], null) == null ? [] : local.m096["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target" {
    for_each = try(local.m096["target"], null) == null ? [] : local.m096["target"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m096["version_context"], null) == null ? [] : local.m096["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
