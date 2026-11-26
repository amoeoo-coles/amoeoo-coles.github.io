# Sample data source intersight_virtualization_vmware_cluster — reads ../models/data_intersight_virtualization_vmware_cluster.yml
locals { m1411 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_cluster.yml"))["data_intersight_virtualization_vmware_cluster"] }

data "intersight_virtualization_vmware_cluster" "n1411" {
  account_moid = try(local.m1411["account_moid"], null)
  additional_properties = try(local.m1411["additional_properties"], null)
  class_id = try(local.m1411["class_id"], null)
  cpu_over_commitment = try(local.m1411["cpu_over_commitment"], null)
  create_time = try(local.m1411["create_time"], null)
  datastore_count = try(local.m1411["datastore_count"], null)
  domain_group_moid = try(local.m1411["domain_group_moid"], null)
  hypervisor_type = try(local.m1411["hypervisor_type"], null)
  hypervisor_version = try(local.m1411["hypervisor_version"], null)
  id = try(local.m1411["id"], null)
  identity = try(local.m1411["identity"], null)
  inventory_path = try(local.m1411["inventory_path"], null)
  mod_time = try(local.m1411["mod_time"], null)
  moid = try(local.m1411["moid"], null)
  name = try(local.m1411["name"], null)
  object_type = try(local.m1411["object_type"], null)
  owners = try(local.m1411["owners"], null)
  proactive_ha_enabled = try(local.m1411["proactive_ha_enabled"], null)
  results = try(local.m1411["results"], null)
  shared_scope = try(local.m1411["shared_scope"], null)
  status = try(local.m1411["status"], null)
  total_cores = try(local.m1411["total_cores"], null)
  dynamic "alarm_summary" {
    for_each = try(local.m1411["alarm_summary"], null) == null ? [] : local.m1411["alarm_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1411["ancestors"], null) == null ? [] : local.m1411["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "attached_resource_tags" {
    for_each = try(local.m1411["attached_resource_tags"], null) == null ? [] : local.m1411["attached_resource_tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "datacenter" {
    for_each = try(local.m1411["datacenter"], null) == null ? [] : local.m1411["datacenter"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "memory_capacity" {
    for_each = try(local.m1411["memory_capacity"], null) == null ? [] : local.m1411["memory_capacity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1411["parent"], null) == null ? [] : local.m1411["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1411["permission_resources"], null) == null ? [] : local.m1411["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "processor_capacity" {
    for_each = try(local.m1411["processor_capacity"], null) == null ? [] : local.m1411["processor_capacity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1411["registered_device"], null) == null ? [] : local.m1411["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_clusters" {
    for_each = try(local.m1411["storage_clusters"], null) == null ? [] : local.m1411["storage_clusters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1411["tags"], null) == null ? [] : local.m1411["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1411["version_context"], null) == null ? [] : local.m1411["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
