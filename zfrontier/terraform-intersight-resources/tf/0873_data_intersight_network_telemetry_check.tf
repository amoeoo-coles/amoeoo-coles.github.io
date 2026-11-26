# Sample data source intersight_network_telemetry_check — reads ../models/data_intersight_network_telemetry_check.yml
locals { m873 = yamldecode(file("${path.module}/../models/data_intersight_network_telemetry_check.yml"))["data_intersight_network_telemetry_check"] }

data "intersight_network_telemetry_check" "n873" {
  account_moid = try(local.m873["account_moid"], null)
  additional_properties = try(local.m873["additional_properties"], null)
  class_id = try(local.m873["class_id"], null)
  create_time = try(local.m873["create_time"], null)
  device_mo_id = try(local.m873["device_mo_id"], null)
  dn = try(local.m873["dn"], null)
  domain_group_moid = try(local.m873["domain_group_moid"], null)
  id = try(local.m873["id"], null)
  mod_time = try(local.m873["mod_time"], null)
  moid = try(local.m873["moid"], null)
  object_type = try(local.m873["object_type"], null)
  owners = try(local.m873["owners"], null)
  results = try(local.m873["results"], null)
  rn = try(local.m873["rn"], null)
  shared_scope = try(local.m873["shared_scope"], null)
  status = try(local.m873["status"], null)
  telemetry_config = try(local.m873["telemetry_config"], null)
  dynamic "ancestors" {
    for_each = try(local.m873["ancestors"], null) == null ? [] : local.m873["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m873["parent"], null) == null ? [] : local.m873["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m873["permission_resources"], null) == null ? [] : local.m873["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m873["registered_device"], null) == null ? [] : local.m873["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m873["tags"], null) == null ? [] : local.m873["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m873["version_context"], null) == null ? [] : local.m873["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
