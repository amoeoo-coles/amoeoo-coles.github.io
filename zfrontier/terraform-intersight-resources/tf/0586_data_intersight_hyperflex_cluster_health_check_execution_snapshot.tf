# Sample data source intersight_hyperflex_cluster_health_check_execution_snapshot — reads ../models/data_intersight_hyperflex_cluster_health_check_execution_snapshot.yml
locals { m586 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_cluster_health_check_execution_snapshot.yml"))["data_intersight_hyperflex_cluster_health_check_execution_snapshot"] }

data "intersight_hyperflex_cluster_health_check_execution_snapshot" "n586" {
  account_moid = try(local.m586["account_moid"], null)
  additional_properties = try(local.m586["additional_properties"], null)
  class_id = try(local.m586["class_id"], null)
  create_time = try(local.m586["create_time"], null)
  domain_group_moid = try(local.m586["domain_group_moid"], null)
  execution_context = try(local.m586["execution_context"], null)
  id = try(local.m586["id"], null)
  mod_time = try(local.m586["mod_time"], null)
  moid = try(local.m586["moid"], null)
  object_type = try(local.m586["object_type"], null)
  owners = try(local.m586["owners"], null)
  results = try(local.m586["results"], null)
  shared_scope = try(local.m586["shared_scope"], null)
  timestamp = try(local.m586["timestamp"], null)
  dynamic "ancestors" {
    for_each = try(local.m586["ancestors"], null) == null ? [] : local.m586["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hx_cluster" {
    for_each = try(local.m586["hx_cluster"], null) == null ? [] : local.m586["hx_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m586["parent"], null) == null ? [] : local.m586["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m586["permission_resources"], null) == null ? [] : local.m586["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m586["registered_device"], null) == null ? [] : local.m586["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m586["tags"], null) == null ? [] : local.m586["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m586["version_context"], null) == null ? [] : local.m586["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow" {
    for_each = try(local.m586["workflow"], null) == null ? [] : local.m586["workflow"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
