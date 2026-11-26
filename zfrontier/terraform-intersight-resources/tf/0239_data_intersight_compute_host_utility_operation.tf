# Sample data source intersight_compute_host_utility_operation — reads ../models/data_intersight_compute_host_utility_operation.yml
locals { m239 = yamldecode(file("${path.module}/../models/data_intersight_compute_host_utility_operation.yml"))["data_intersight_compute_host_utility_operation"] }

data "intersight_compute_host_utility_operation" "n239" {
  account_moid = try(local.m239["account_moid"], null)
  additional_properties = try(local.m239["additional_properties"], null)
  class_id = try(local.m239["class_id"], null)
  create_time = try(local.m239["create_time"], null)
  domain_group_moid = try(local.m239["domain_group_moid"], null)
  host_utility_operation_mode = try(local.m239["host_utility_operation_mode"], null)
  host_utility_operation_status = try(local.m239["host_utility_operation_status"], null)
  id = try(local.m239["id"], null)
  mod_time = try(local.m239["mod_time"], null)
  moid = try(local.m239["moid"], null)
  object_type = try(local.m239["object_type"], null)
  owners = try(local.m239["owners"], null)
  results = try(local.m239["results"], null)
  shared_scope = try(local.m239["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m239["ancestors"], null) == null ? [] : local.m239["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "download_status" {
    for_each = try(local.m239["download_status"], null) == null ? [] : local.m239["download_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host_op_config" {
    for_each = try(local.m239["host_op_config"], null) == null ? [] : local.m239["host_op_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m239["parent"], null) == null ? [] : local.m239["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m239["permission_resources"], null) == null ? [] : local.m239["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m239["server"], null) == null ? [] : local.m239["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m239["tags"], null) == null ? [] : local.m239["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m239["version_context"], null) == null ? [] : local.m239["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow" {
    for_each = try(local.m239["workflow"], null) == null ? [] : local.m239["workflow"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
