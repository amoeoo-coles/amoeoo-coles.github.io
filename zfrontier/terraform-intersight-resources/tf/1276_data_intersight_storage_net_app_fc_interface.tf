# Sample data source intersight_storage_net_app_fc_interface — reads ../models/data_intersight_storage_net_app_fc_interface.yml
locals { m1276 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_fc_interface.yml"))["data_intersight_storage_net_app_fc_interface"] }

data "intersight_storage_net_app_fc_interface" "n1276" {
  account_moid = try(local.m1276["account_moid"], null)
  additional_properties = try(local.m1276["additional_properties"], null)
  class_id = try(local.m1276["class_id"], null)
  create_time = try(local.m1276["create_time"], null)
  domain_group_moid = try(local.m1276["domain_group_moid"], null)
  enabled = try(local.m1276["enabled"], null)
  id = try(local.m1276["id"], null)
  interface_state = try(local.m1276["interface_state"], null)
  iqn = try(local.m1276["iqn"], null)
  mod_time = try(local.m1276["mod_time"], null)
  moid = try(local.m1276["moid"], null)
  name = try(local.m1276["name"], null)
  object_type = try(local.m1276["object_type"], null)
  owners = try(local.m1276["owners"], null)
  results = try(local.m1276["results"], null)
  shared_scope = try(local.m1276["shared_scope"], null)
  speed = try(local.m1276["speed"], null)
  state = try(local.m1276["state"], null)
  status = try(local.m1276["status"], null)
  svm_name = try(local.m1276["svm_name"], null)
  type = try(local.m1276["type"], null)
  uuid = try(local.m1276["uuid"], null)
  volume_name = try(local.m1276["volume_name"], null)
  wwn = try(local.m1276["wwn"], null)
  wwnn = try(local.m1276["wwnn"], null)
  wwpn = try(local.m1276["wwpn"], null)
  dynamic "ancestors" {
    for_each = try(local.m1276["ancestors"], null) == null ? [] : local.m1276["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array_controller" {
    for_each = try(local.m1276["array_controller"], null) == null ? [] : local.m1276["array_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "events" {
    for_each = try(local.m1276["events"], null) == null ? [] : local.m1276["events"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1276["parent"], null) == null ? [] : local.m1276["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1276["permission_resources"], null) == null ? [] : local.m1276["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_port" {
    for_each = try(local.m1276["physical_port"], null) == null ? [] : local.m1276["physical_port"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1276["tags"], null) == null ? [] : local.m1276["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1276["tenant"], null) == null ? [] : local.m1276["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1276["version_context"], null) == null ? [] : local.m1276["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
