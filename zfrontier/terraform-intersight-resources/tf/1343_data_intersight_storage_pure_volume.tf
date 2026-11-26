# Sample data source intersight_storage_pure_volume — reads ../models/data_intersight_storage_pure_volume.yml
locals { m1343 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_volume.yml"))["data_intersight_storage_pure_volume"] }

data "intersight_storage_pure_volume" "n1343" {
  account_moid = try(local.m1343["account_moid"], null)
  additional_properties = try(local.m1343["additional_properties"], null)
  class_id = try(local.m1343["class_id"], null)
  create_time = try(local.m1343["create_time"], null)
  created = try(local.m1343["created"], null)
  description = try(local.m1343["description"], null)
  domain_group_moid = try(local.m1343["domain_group_moid"], null)
  id = try(local.m1343["id"], null)
  mod_time = try(local.m1343["mod_time"], null)
  moid = try(local.m1343["moid"], null)
  naa_id = try(local.m1343["naa_id"], null)
  name = try(local.m1343["name"], null)
  nr_source = try(local.m1343["nr_source"], null)
  nx_vm_disk_id = try(local.m1343["nx_vm_disk_id"], null)
  nx_vm_id = try(local.m1343["nx_vm_id"], null)
  object_type = try(local.m1343["object_type"], null)
  owners = try(local.m1343["owners"], null)
  pod_name = try(local.m1343["pod_name"], null)
  realm_name = try(local.m1343["realm_name"], null)
  results = try(local.m1343["results"], null)
  serial = try(local.m1343["serial"], null)
  shared_scope = try(local.m1343["shared_scope"], null)
  size = try(local.m1343["size"], null)
  dynamic "ancestors" {
    for_each = try(local.m1343["ancestors"], null) == null ? [] : local.m1343["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1343["array"], null) == null ? [] : local.m1343["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1343["parent"], null) == null ? [] : local.m1343["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1343["permission_resources"], null) == null ? [] : local.m1343["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pod" {
    for_each = try(local.m1343["pod"], null) == null ? [] : local.m1343["pod"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "protection_group" {
    for_each = try(local.m1343["protection_group"], null) == null ? [] : local.m1343["protection_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "realm" {
    for_each = try(local.m1343["realm"], null) == null ? [] : local.m1343["realm"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1343["registered_device"], null) == null ? [] : local.m1343["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1343["storage_utilization"], null) == null ? [] : local.m1343["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1343["tags"], null) == null ? [] : local.m1343["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1343["version_context"], null) == null ? [] : local.m1343["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
