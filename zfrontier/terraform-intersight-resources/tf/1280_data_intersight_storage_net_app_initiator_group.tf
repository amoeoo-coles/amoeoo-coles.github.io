# Sample data source intersight_storage_net_app_initiator_group — reads ../models/data_intersight_storage_net_app_initiator_group.yml
locals { m1280 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_initiator_group.yml"))["data_intersight_storage_net_app_initiator_group"] }

data "intersight_storage_net_app_initiator_group" "n1280" {
  account_moid = try(local.m1280["account_moid"], null)
  additional_properties = try(local.m1280["additional_properties"], null)
  class_id = try(local.m1280["class_id"], null)
  create_time = try(local.m1280["create_time"], null)
  description = try(local.m1280["description"], null)
  domain_group_moid = try(local.m1280["domain_group_moid"], null)
  id = try(local.m1280["id"], null)
  mod_time = try(local.m1280["mod_time"], null)
  moid = try(local.m1280["moid"], null)
  name = try(local.m1280["name"], null)
  object_type = try(local.m1280["object_type"], null)
  os_type = try(local.m1280["os_type"], null)
  owners = try(local.m1280["owners"], null)
  protocol = try(local.m1280["protocol"], null)
  results = try(local.m1280["results"], null)
  shared_scope = try(local.m1280["shared_scope"], null)
  svm_name = try(local.m1280["svm_name"], null)
  uuid = try(local.m1280["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1280["ancestors"], null) == null ? [] : local.m1280["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "initiators" {
    for_each = try(local.m1280["initiators"], null) == null ? [] : local.m1280["initiators"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1280["parent"], null) == null ? [] : local.m1280["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1280["permission_resources"], null) == null ? [] : local.m1280["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1280["storage_utilization"], null) == null ? [] : local.m1280["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1280["tags"], null) == null ? [] : local.m1280["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1280["tenant"], null) == null ? [] : local.m1280["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1280["version_context"], null) == null ? [] : local.m1280["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
