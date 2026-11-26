# Sample data source intersight_virtualization_vmware_datastore — reads ../models/data_intersight_virtualization_vmware_datastore.yml
locals { m1413 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_datastore.yml"))["data_intersight_virtualization_vmware_datastore"] }

data "intersight_virtualization_vmware_datastore" "n1413" {
  accessible = try(local.m1413["accessible"], null)
  account_moid = try(local.m1413["account_moid"], null)
  additional_properties = try(local.m1413["additional_properties"], null)
  class_id = try(local.m1413["class_id"], null)
  create_time = try(local.m1413["create_time"], null)
  domain_group_moid = try(local.m1413["domain_group_moid"], null)
  host_count = try(local.m1413["host_count"], null)
  id = try(local.m1413["id"], null)
  identity = try(local.m1413["identity"], null)
  inventory_path = try(local.m1413["inventory_path"], null)
  maintenance_mode = try(local.m1413["maintenance_mode"], null)
  mod_time = try(local.m1413["mod_time"], null)
  moid = try(local.m1413["moid"], null)
  multiple_host_access = try(local.m1413["multiple_host_access"], null)
  name = try(local.m1413["name"], null)
  object_type = try(local.m1413["object_type"], null)
  owners = try(local.m1413["owners"], null)
  results = try(local.m1413["results"], null)
  shared_scope = try(local.m1413["shared_scope"], null)
  status = try(local.m1413["status"], null)
  thin_provisioning_supported = try(local.m1413["thin_provisioning_supported"], null)
  type = try(local.m1413["type"], null)
  un_committed = try(local.m1413["un_committed"], null)
  url = try(local.m1413["url"], null)
  vm_count = try(local.m1413["vm_count"], null)
  vm_template_count = try(local.m1413["vm_template_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m1413["ancestors"], null) == null ? [] : local.m1413["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capacity" {
    for_each = try(local.m1413["capacity"], null) == null ? [] : local.m1413["capacity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m1413["cluster"], null) == null ? [] : local.m1413["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "clusters" {
    for_each = try(local.m1413["clusters"], null) == null ? [] : local.m1413["clusters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "datacenter" {
    for_each = try(local.m1413["datacenter"], null) == null ? [] : local.m1413["datacenter"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "datastore_cluster" {
    for_each = try(local.m1413["datastore_cluster"], null) == null ? [] : local.m1413["datastore_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hosts" {
    for_each = try(local.m1413["hosts"], null) == null ? [] : local.m1413["hosts"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1413["parent"], null) == null ? [] : local.m1413["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1413["permission_resources"], null) == null ? [] : local.m1413["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1413["registered_device"], null) == null ? [] : local.m1413["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1413["tags"], null) == null ? [] : local.m1413["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1413["version_context"], null) == null ? [] : local.m1413["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
