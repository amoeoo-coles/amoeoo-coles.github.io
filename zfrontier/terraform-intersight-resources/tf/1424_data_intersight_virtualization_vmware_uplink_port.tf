# Sample data source intersight_virtualization_vmware_uplink_port — reads ../models/data_intersight_virtualization_vmware_uplink_port.yml
locals { m1424 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_uplink_port.yml"))["data_intersight_virtualization_vmware_uplink_port"] }

data "intersight_virtualization_vmware_uplink_port" "n1424" {
  account_moid = try(local.m1424["account_moid"], null)
  additional_properties = try(local.m1424["additional_properties"], null)
  class_id = try(local.m1424["class_id"], null)
  create_time = try(local.m1424["create_time"], null)
  domain_group_moid = try(local.m1424["domain_group_moid"], null)
  id = try(local.m1424["id"], null)
  identity = try(local.m1424["identity"], null)
  key = try(var.secrets["data_intersight_virtualization_vmware_uplink_port.key"], local.m1424["key"])
  mod_time = try(local.m1424["mod_time"], null)
  moid = try(local.m1424["moid"], null)
  name = try(local.m1424["name"], null)
  object_type = try(local.m1424["object_type"], null)
  owners = try(local.m1424["owners"], null)
  results = try(local.m1424["results"], null)
  shared_scope = try(local.m1424["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1424["ancestors"], null) == null ? [] : local.m1424["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributed_network" {
    for_each = try(local.m1424["distributed_network"], null) == null ? [] : local.m1424["distributed_network"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host" {
    for_each = try(local.m1424["host"], null) == null ? [] : local.m1424["host"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1424["parent"], null) == null ? [] : local.m1424["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1424["permission_resources"], null) == null ? [] : local.m1424["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_network_interface" {
    for_each = try(local.m1424["physical_network_interface"], null) == null ? [] : local.m1424["physical_network_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1424["registered_device"], null) == null ? [] : local.m1424["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1424["tags"], null) == null ? [] : local.m1424["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1424["version_context"], null) == null ? [] : local.m1424["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
