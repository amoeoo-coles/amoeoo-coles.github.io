# Sample data source intersight_appliance_system_info — reads ../models/data_intersight_appliance_system_info.yml
locals { m077 = yamldecode(file("${path.module}/../models/data_intersight_appliance_system_info.yml"))["data_intersight_appliance_system_info"] }

data "intersight_appliance_system_info" "n077" {
  account_moid = try(local.m077["account_moid"], null)
  additional_properties = try(local.m077["additional_properties"], null)
  class_id = try(local.m077["class_id"], null)
  cloud_conn_status = try(local.m077["cloud_conn_status"], null)
  cluster_status = try(local.m077["cluster_status"], null)
  create_time = try(local.m077["create_time"], null)
  deployment_size = try(local.m077["deployment_size"], null)
  domain_group_moid = try(local.m077["domain_group_moid"], null)
  hostname = try(local.m077["hostname"], null)
  id = try(local.m077["id"], null)
  init_done = try(local.m077["init_done"], null)
  ip_address = try(local.m077["ip_address"], null)
  is_virtual_ip = try(local.m077["is_virtual_ip"], null)
  mod_time = try(local.m077["mod_time"], null)
  moid = try(local.m077["moid"], null)
  nr_version = try(local.m077["nr_version"], null)
  object_type = try(local.m077["object_type"], null)
  operational_status = try(local.m077["operational_status"], null)
  owners = try(local.m077["owners"], null)
  results = try(local.m077["results"], null)
  serial_id = try(local.m077["serial_id"], null)
  shared_scope = try(local.m077["shared_scope"], null)
  time_zone = try(local.m077["time_zone"], null)
  dynamic "ancestors" {
    for_each = try(local.m077["ancestors"], null) == null ? [] : local.m077["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m077["parent"], null) == null ? [] : local.m077["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m077["permission_resources"], null) == null ? [] : local.m077["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m077["tags"], null) == null ? [] : local.m077["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m077["version_context"], null) == null ? [] : local.m077["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
