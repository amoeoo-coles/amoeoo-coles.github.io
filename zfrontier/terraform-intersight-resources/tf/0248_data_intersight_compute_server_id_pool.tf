# Sample data source intersight_compute_server_id_pool — reads ../models/data_intersight_compute_server_id_pool.yml
locals { m248 = yamldecode(file("${path.module}/../models/data_intersight_compute_server_id_pool.yml"))["data_intersight_compute_server_id_pool"] }

data "intersight_compute_server_id_pool" "n248" {
  account_moid = try(local.m248["account_moid"], null)
  additional_properties = try(local.m248["additional_properties"], null)
  class_id = try(local.m248["class_id"], null)
  create_time = try(local.m248["create_time"], null)
  domain_group_moid = try(local.m248["domain_group_moid"], null)
  gap_available_ids = try(local.m248["gap_available_ids"], null)
  id = try(local.m248["id"], null)
  mod_time = try(local.m248["mod_time"], null)
  moid = try(local.m248["moid"], null)
  next_available_id = try(local.m248["next_available_id"], null)
  object_type = try(local.m248["object_type"], null)
  owners = try(local.m248["owners"], null)
  preferred_ids = try(local.m248["preferred_ids"], null)
  results = try(local.m248["results"], null)
  shared_scope = try(local.m248["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m248["ancestors"], null) == null ? [] : local.m248["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_registration" {
    for_each = try(local.m248["device_registration"], null) == null ? [] : local.m248["device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m248["parent"], null) == null ? [] : local.m248["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m248["permission_resources"], null) == null ? [] : local.m248["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m248["tags"], null) == null ? [] : local.m248["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m248["version_context"], null) == null ? [] : local.m248["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
