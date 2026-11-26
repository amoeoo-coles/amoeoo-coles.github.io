# Sample data source intersight_catalystsdwan_wan_edge_device_maintenance_activity — reads ../models/data_intersight_catalystsdwan_wan_edge_device_maintenance_activity.yml
locals { m207 = yamldecode(file("${path.module}/../models/data_intersight_catalystsdwan_wan_edge_device_maintenance_activity.yml"))["data_intersight_catalystsdwan_wan_edge_device_maintenance_activity"] }

data "intersight_catalystsdwan_wan_edge_device_maintenance_activity" "n207" {
  account_moid = try(local.m207["account_moid"], null)
  activity_type = try(local.m207["activity_type"], null)
  additional_properties = try(local.m207["additional_properties"], null)
  chassis_number = try(local.m207["chassis_number"], null)
  class_id = try(local.m207["class_id"], null)
  create_time = try(local.m207["create_time"], null)
  device_model = try(local.m207["device_model"], null)
  domain_group_moid = try(local.m207["domain_group_moid"], null)
  duration_in_mins = try(local.m207["duration_in_mins"], null)
  host_name = try(local.m207["host_name"], null)
  id = try(local.m207["id"], null)
  location = try(local.m207["location"], null)
  mod_time = try(local.m207["mod_time"], null)
  moid = try(local.m207["moid"], null)
  object_type = try(local.m207["object_type"], null)
  owners = try(local.m207["owners"], null)
  results = try(local.m207["results"], null)
  shared_scope = try(local.m207["shared_scope"], null)
  site_name = try(local.m207["site_name"], null)
  start_time_in_utc = try(local.m207["start_time_in_utc"], null)
  system_ip = try(local.m207["system_ip"], null)
  dynamic "ancestors" {
    for_each = try(local.m207["ancestors"], null) == null ? [] : local.m207["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m207["parent"], null) == null ? [] : local.m207["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m207["permission_resources"], null) == null ? [] : local.m207["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m207["registered_device"], null) == null ? [] : local.m207["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m207["tags"], null) == null ? [] : local.m207["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m207["version_context"], null) == null ? [] : local.m207["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "wan_edge_device" {
    for_each = try(local.m207["wan_edge_device"], null) == null ? [] : local.m207["wan_edge_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
