# Sample data source intersight_storage_pure_host — reads ../models/data_intersight_storage_pure_host.yml
locals { m1325 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_host.yml"))["data_intersight_storage_pure_host"] }

data "intersight_storage_pure_host" "n1325" {
  account_moid = try(local.m1325["account_moid"], null)
  additional_properties = try(local.m1325["additional_properties"], null)
  class_id = try(local.m1325["class_id"], null)
  create_time = try(local.m1325["create_time"], null)
  description = try(local.m1325["description"], null)
  domain_group_moid = try(local.m1325["domain_group_moid"], null)
  host_group_name = try(local.m1325["host_group_name"], null)
  id = try(local.m1325["id"], null)
  mod_time = try(local.m1325["mod_time"], null)
  moid = try(local.m1325["moid"], null)
  name = try(local.m1325["name"], null)
  object_type = try(local.m1325["object_type"], null)
  os_type = try(local.m1325["os_type"], null)
  owners = try(local.m1325["owners"], null)
  realm_name = try(local.m1325["realm_name"], null)
  results = try(local.m1325["results"], null)
  shared_scope = try(local.m1325["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1325["ancestors"], null) == null ? [] : local.m1325["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1325["array"], null) == null ? [] : local.m1325["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host_group" {
    for_each = try(local.m1325["host_group"], null) == null ? [] : local.m1325["host_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "initiators" {
    for_each = try(local.m1325["initiators"], null) == null ? [] : local.m1325["initiators"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1325["parent"], null) == null ? [] : local.m1325["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1325["permission_resources"], null) == null ? [] : local.m1325["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "protection_group" {
    for_each = try(local.m1325["protection_group"], null) == null ? [] : local.m1325["protection_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "realm" {
    for_each = try(local.m1325["realm"], null) == null ? [] : local.m1325["realm"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1325["registered_device"], null) == null ? [] : local.m1325["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1325["storage_utilization"], null) == null ? [] : local.m1325["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1325["tags"], null) == null ? [] : local.m1325["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1325["version_context"], null) == null ? [] : local.m1325["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
