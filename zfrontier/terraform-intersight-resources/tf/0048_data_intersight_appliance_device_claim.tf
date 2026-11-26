# Sample data source intersight_appliance_device_claim — reads ../models/data_intersight_appliance_device_claim.yml
locals { m048 = yamldecode(file("${path.module}/../models/data_intersight_appliance_device_claim.yml"))["data_intersight_appliance_device_claim"] }

data "intersight_appliance_device_claim" "n048" {
  account_moid = try(local.m048["account_moid"], null)
  additional_properties = try(local.m048["additional_properties"], null)
  class_id = try(local.m048["class_id"], null)
  create_time = try(local.m048["create_time"], null)
  device_id = try(local.m048["device_id"], null)
  domain_group_moid = try(local.m048["domain_group_moid"], null)
  hostname = try(local.m048["hostname"], null)
  id = try(local.m048["id"], null)
  is_password_set = try(var.secrets["data_intersight_appliance_device_claim.is_password_set"], local.m048["is_password_set"])
  is_renew = try(local.m048["is_renew"], null)
  message = try(local.m048["message"], null)
  mod_time = try(local.m048["mod_time"], null)
  moid = try(local.m048["moid"], null)
  object_type = try(local.m048["object_type"], null)
  owners = try(local.m048["owners"], null)
  password = try(var.secrets["data_intersight_appliance_device_claim.password"], local.m048["password"])
  platform_type = try(local.m048["platform_type"], null)
  request_id = try(local.m048["request_id"], null)
  results = try(local.m048["results"], null)
  security_token = try(var.secrets["data_intersight_appliance_device_claim.security_token"], local.m048["security_token"])
  shared_scope = try(local.m048["shared_scope"], null)
  status = try(local.m048["status"], null)
  username = try(local.m048["username"], null)
  dynamic "account" {
    for_each = try(local.m048["account"], null) == null ? [] : local.m048["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m048["ancestors"], null) == null ? [] : local.m048["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_location" {
    for_each = try(local.m048["assigned_location"], null) == null ? [] : local.m048["assigned_location"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m048["parent"], null) == null ? [] : local.m048["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m048["permission_resources"], null) == null ? [] : local.m048["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservation" {
    for_each = try(local.m048["reservation"], null) == null ? [] : local.m048["reservation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m048["tags"], null) == null ? [] : local.m048["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tls_certificate" {
    for_each = try(local.m048["tls_certificate"], null) == null ? [] : local.m048["tls_certificate"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m048["version_context"], null) == null ? [] : local.m048["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
