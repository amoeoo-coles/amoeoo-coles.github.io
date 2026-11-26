# Sample data source intersight_appliance_file_system_telemetry — reads ../models/data_intersight_appliance_file_system_telemetry.yml
locals { m058 = yamldecode(file("${path.module}/../models/data_intersight_appliance_file_system_telemetry.yml"))["data_intersight_appliance_file_system_telemetry"] }

data "intersight_appliance_file_system_telemetry" "n058" {
  account_moid = try(local.m058["account_moid"], null)
  additional_properties = try(local.m058["additional_properties"], null)
  class_id = try(local.m058["class_id"], null)
  create_time = try(local.m058["create_time"], null)
  disk_order = try(local.m058["disk_order"], null)
  domain_group_moid = try(local.m058["domain_group_moid"], null)
  id = try(local.m058["id"], null)
  instance = try(local.m058["instance"], null)
  mod_time = try(local.m058["mod_time"], null)
  moid = try(local.m058["moid"], null)
  mountpoint = try(local.m058["mountpoint"], null)
  object_type = try(local.m058["object_type"], null)
  owners = try(local.m058["owners"], null)
  results = try(local.m058["results"], null)
  shared_scope = try(local.m058["shared_scope"], null)
  usage = try(local.m058["usage"], null)
  dynamic "ancestors" {
    for_each = try(local.m058["ancestors"], null) == null ? [] : local.m058["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m058["parent"], null) == null ? [] : local.m058["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m058["permission_resources"], null) == null ? [] : local.m058["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m058["registered_device"], null) == null ? [] : local.m058["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m058["tags"], null) == null ? [] : local.m058["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m058["version_context"], null) == null ? [] : local.m058["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
