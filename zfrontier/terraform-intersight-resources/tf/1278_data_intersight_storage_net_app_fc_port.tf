# Sample data source intersight_storage_net_app_fc_port — reads ../models/data_intersight_storage_net_app_fc_port.yml
locals { m1278 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_fc_port.yml"))["data_intersight_storage_net_app_fc_port"] }

data "intersight_storage_net_app_fc_port" "n1278" {
  account_moid = try(local.m1278["account_moid"], null)
  additional_properties = try(local.m1278["additional_properties"], null)
  class_id = try(local.m1278["class_id"], null)
  create_time = try(local.m1278["create_time"], null)
  domain_group_moid = try(local.m1278["domain_group_moid"], null)
  id = try(local.m1278["id"], null)
  iqn = try(local.m1278["iqn"], null)
  mod_time = try(local.m1278["mod_time"], null)
  moid = try(local.m1278["moid"], null)
  name = try(local.m1278["name"], null)
  node_name = try(local.m1278["node_name"], null)
  object_type = try(local.m1278["object_type"], null)
  owners = try(local.m1278["owners"], null)
  port_status = try(local.m1278["port_status"], null)
  results = try(local.m1278["results"], null)
  shared_scope = try(local.m1278["shared_scope"], null)
  speed = try(local.m1278["speed"], null)
  speed_configured = try(local.m1278["speed_configured"], null)
  speed_maximum = try(local.m1278["speed_maximum"], null)
  state = try(local.m1278["state"], null)
  status = try(local.m1278["status"], null)
  type = try(local.m1278["type"], null)
  uuid = try(local.m1278["uuid"], null)
  wwn = try(local.m1278["wwn"], null)
  wwnn = try(local.m1278["wwnn"], null)
  wwpn = try(local.m1278["wwpn"], null)
  dynamic "ancestors" {
    for_each = try(local.m1278["ancestors"], null) == null ? [] : local.m1278["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array_controller" {
    for_each = try(local.m1278["array_controller"], null) == null ? [] : local.m1278["array_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "events" {
    for_each = try(local.m1278["events"], null) == null ? [] : local.m1278["events"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1278["parent"], null) == null ? [] : local.m1278["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1278["permission_resources"], null) == null ? [] : local.m1278["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1278["tags"], null) == null ? [] : local.m1278["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1278["version_context"], null) == null ? [] : local.m1278["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
