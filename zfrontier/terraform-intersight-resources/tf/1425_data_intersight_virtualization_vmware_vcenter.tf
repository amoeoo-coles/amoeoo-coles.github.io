# Sample data source intersight_virtualization_vmware_vcenter — reads ../models/data_intersight_virtualization_vmware_vcenter.yml
locals { m1425 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_vcenter.yml"))["data_intersight_virtualization_vmware_vcenter"] }

data "intersight_virtualization_vmware_vcenter" "n1425" {
  account_moid = try(local.m1425["account_moid"], null)
  additional_properties = try(local.m1425["additional_properties"], null)
  build = try(local.m1425["build"], null)
  class_id = try(local.m1425["class_id"], null)
  cluster_count = try(local.m1425["cluster_count"], null)
  create_time = try(local.m1425["create_time"], null)
  datacenter_count = try(local.m1425["datacenter_count"], null)
  datastore_count = try(local.m1425["datastore_count"], null)
  distributed_virtual_switch_count = try(local.m1425["distributed_virtual_switch_count"], null)
  domain_group_moid = try(local.m1425["domain_group_moid"], null)
  ds_cluster_count = try(local.m1425["ds_cluster_count"], null)
  external_ip = try(local.m1425["external_ip"], null)
  host_count = try(local.m1425["host_count"], null)
  id = try(local.m1425["id"], null)
  identity = try(local.m1425["identity"], null)
  ip_address = try(local.m1425["ip_address"], null)
  mod_time = try(local.m1425["mod_time"], null)
  moid = try(local.m1425["moid"], null)
  name = try(local.m1425["name"], null)
  nr_version = try(local.m1425["nr_version"], null)
  object_type = try(local.m1425["object_type"], null)
  owners = try(local.m1425["owners"], null)
  results = try(local.m1425["results"], null)
  shared_scope = try(local.m1425["shared_scope"], null)
  target_name = try(local.m1425["target_name"], null)
  vm_count = try(local.m1425["vm_count"], null)
  vm_templates_count = try(local.m1425["vm_templates_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m1425["ancestors"], null) == null ? [] : local.m1425["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1425["parent"], null) == null ? [] : local.m1425["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1425["permission_resources"], null) == null ? [] : local.m1425["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1425["registered_device"], null) == null ? [] : local.m1425["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1425["tags"], null) == null ? [] : local.m1425["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1425["version_context"], null) == null ? [] : local.m1425["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
