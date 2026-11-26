# Sample data source intersight_virtualization_host — reads ../models/data_intersight_virtualization_host.yml
locals { m1409 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_host.yml"))["data_intersight_virtualization_host"] }

data "intersight_virtualization_host" "n1409" {
  account_moid = try(local.m1409["account_moid"], null)
  action = try(local.m1409["action"], null)
  additional_properties = try(local.m1409["additional_properties"], null)
  class_id = try(local.m1409["class_id"], null)
  create_time = try(local.m1409["create_time"], null)
  discovered = try(local.m1409["discovered"], null)
  domain_group_moid = try(local.m1409["domain_group_moid"], null)
  evacuate = try(local.m1409["evacuate"], null)
  hypervisor_type = try(local.m1409["hypervisor_type"], null)
  id = try(local.m1409["id"], null)
  identity = try(local.m1409["identity"], null)
  maintenance_state = try(local.m1409["maintenance_state"], null)
  mod_time = try(local.m1409["mod_time"], null)
  model = try(local.m1409["model"], null)
  moid = try(local.m1409["moid"], null)
  name = try(local.m1409["name"], null)
  object_type = try(local.m1409["object_type"], null)
  owners = try(local.m1409["owners"], null)
  results = try(local.m1409["results"], null)
  serial = try(local.m1409["serial"], null)
  shared_scope = try(local.m1409["shared_scope"], null)
  vendor = try(local.m1409["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1409["ancestors"], null) == null ? [] : local.m1409["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host_config" {
    for_each = try(local.m1409["host_config"], null) == null ? [] : local.m1409["host_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory" {
    for_each = try(local.m1409["inventory"], null) == null ? [] : local.m1409["inventory"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1409["parent"], null) == null ? [] : local.m1409["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1409["permission_resources"], null) == null ? [] : local.m1409["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1409["registered_device"], null) == null ? [] : local.m1409["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1409["tags"], null) == null ? [] : local.m1409["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1409["version_context"], null) == null ? [] : local.m1409["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_info" {
    for_each = try(local.m1409["workflow_info"], null) == null ? [] : local.m1409["workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
