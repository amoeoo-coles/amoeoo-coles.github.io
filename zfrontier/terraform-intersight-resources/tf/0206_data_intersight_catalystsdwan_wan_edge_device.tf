# Sample data source intersight_catalystsdwan_wan_edge_device — reads ../models/data_intersight_catalystsdwan_wan_edge_device.yml
locals { m206 = yamldecode(file("${path.module}/../models/data_intersight_catalystsdwan_wan_edge_device.yml"))["data_intersight_catalystsdwan_wan_edge_device"] }

data "intersight_catalystsdwan_wan_edge_device" "n206" {
  account_moid = try(local.m206["account_moid"], null)
  additional_properties = try(local.m206["additional_properties"], null)
  bfd_sessions = try(local.m206["bfd_sessions"], null)
  bfd_sessions_up = try(local.m206["bfd_sessions_up"], null)
  class_id = try(local.m206["class_id"], null)
  config_device_status = try(local.m206["config_device_status"], null)
  config_locked = try(local.m206["config_locked"], null)
  control_connections = try(local.m206["control_connections"], null)
  control_connections_up = try(local.m206["control_connections_up"], null)
  create_time = try(local.m206["create_time"], null)
  device_health = try(local.m206["device_health"], null)
  device_id = try(local.m206["device_id"], null)
  device_mo_id = try(local.m206["device_mo_id"], null)
  device_state = try(local.m206["device_state"], null)
  device_type = try(local.m206["device_type"], null)
  dn = try(local.m206["dn"], null)
  domain_group_moid = try(local.m206["domain_group_moid"], null)
  hardware_version = try(local.m206["hardware_version"], null)
  host_name = try(local.m206["host_name"], null)
  id = try(local.m206["id"], null)
  is_upgraded = try(local.m206["is_upgraded"], null)
  last_collected_time = try(local.m206["last_collected_time"], null)
  local_system_ip = try(local.m206["local_system_ip"], null)
  management_port_hw_addr = try(local.m206["management_port_hw_addr"], null)
  management_port_ip = try(local.m206["management_port_ip"], null)
  management_port_subnet = try(local.m206["management_port_subnet"], null)
  mod_time = try(local.m206["mod_time"], null)
  model = try(local.m206["model"], null)
  moid = try(local.m206["moid"], null)
  name = try(local.m206["name"], null)
  nr_version = try(local.m206["nr_version"], null)
  object_type = try(local.m206["object_type"], null)
  organization_name = try(local.m206["organization_name"], null)
  owners = try(local.m206["owners"], null)
  personality = try(local.m206["personality"], null)
  presence = try(local.m206["presence"], null)
  reachability = try(local.m206["reachability"], null)
  results = try(local.m206["results"], null)
  revision = try(local.m206["revision"], null)
  rn = try(local.m206["rn"], null)
  sdwan_user_tags = try(local.m206["sdwan_user_tags"], null)
  serial = try(local.m206["serial"], null)
  shared_scope = try(local.m206["shared_scope"], null)
  site_id = try(local.m206["site_id"], null)
  site_name = try(local.m206["site_name"], null)
  sp_organization_name = try(local.m206["sp_organization_name"], null)
  system_ip = try(local.m206["system_ip"], null)
  tlocs = try(local.m206["tlocs"], null)
  tlocs_up = try(local.m206["tlocs_up"], null)
  uptime = try(local.m206["uptime"], null)
  uuid = try(local.m206["uuid"], null)
  validity = try(local.m206["validity"], null)
  vendor = try(local.m206["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m206["ancestors"], null) == null ? [] : local.m206["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_location" {
    for_each = try(local.m206["device_location"], null) == null ? [] : local.m206["device_location"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m206["parent"], null) == null ? [] : local.m206["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m206["permission_resources"], null) == null ? [] : local.m206["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m206["previous_fru"], null) == null ? [] : local.m206["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m206["registered_device"], null) == null ? [] : local.m206["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m206["tags"], null) == null ? [] : local.m206["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m206["version_context"], null) == null ? [] : local.m206["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
