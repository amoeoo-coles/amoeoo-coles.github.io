# Sample data source intersight_vnic_vif_id_pool — reads ../models/data_intersight_vnic_vif_id_pool.yml
locals { m1489 = yamldecode(file("${path.module}/../models/data_intersight_vnic_vif_id_pool.yml"))["data_intersight_vnic_vif_id_pool"] }

data "intersight_vnic_vif_id_pool" "n1489" {
  account_moid = try(local.m1489["account_moid"], null)
  additional_properties = try(local.m1489["additional_properties"], null)
  class_id = try(local.m1489["class_id"], null)
  create_time = try(local.m1489["create_time"], null)
  domain_group_moid = try(local.m1489["domain_group_moid"], null)
  gap_available_ids = try(local.m1489["gap_available_ids"], null)
  id = try(local.m1489["id"], null)
  mod_time = try(local.m1489["mod_time"], null)
  moid = try(local.m1489["moid"], null)
  next_available_id = try(local.m1489["next_available_id"], null)
  object_type = try(local.m1489["object_type"], null)
  owners = try(local.m1489["owners"], null)
  results = try(local.m1489["results"], null)
  shared_scope = try(local.m1489["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1489["ancestors"], null) == null ? [] : local.m1489["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m1489["network_element"], null) == null ? [] : local.m1489["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1489["parent"], null) == null ? [] : local.m1489["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1489["permission_resources"], null) == null ? [] : local.m1489["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1489["tags"], null) == null ? [] : local.m1489["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1489["version_context"], null) == null ? [] : local.m1489["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
