# Sample data source intersight_hyperflex_protected_cluster — reads ../models/data_intersight_hyperflex_protected_cluster.yml
locals { m622 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_protected_cluster.yml"))["data_intersight_hyperflex_protected_cluster"] }

data "intersight_hyperflex_protected_cluster" "n622" {
  account_moid = try(local.m622["account_moid"], null)
  additional_properties = try(local.m622["additional_properties"], null)
  class_id = try(local.m622["class_id"], null)
  create_time = try(local.m622["create_time"], null)
  domain_group_moid = try(local.m622["domain_group_moid"], null)
  hx_version = try(local.m622["hx_version"], null)
  hypervisor_version = try(local.m622["hypervisor_version"], null)
  id = try(local.m622["id"], null)
  mod_time = try(local.m622["mod_time"], null)
  moid = try(local.m622["moid"], null)
  object_type = try(local.m622["object_type"], null)
  owners = try(local.m622["owners"], null)
  protected_datastore_name = try(local.m622["protected_datastore_name"], null)
  protected_vms_count = try(local.m622["protected_vms_count"], null)
  results = try(local.m622["results"], null)
  shared_scope = try(local.m622["shared_scope"], null)
  source_cluster_name = try(local.m622["source_cluster_name"], null)
  target_cluster_name = try(local.m622["target_cluster_name"], null)
  target_datastore_name = try(local.m622["target_datastore_name"], null)
  target_datastore_utilization = try(local.m622["target_datastore_utilization"], null)
  dynamic "ancestors" {
    for_each = try(local.m622["ancestors"], null) == null ? [] : local.m622["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "backup_policy" {
    for_each = try(local.m622["backup_policy"], null) == null ? [] : local.m622["backup_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "datastore_statistic" {
    for_each = try(local.m622["datastore_statistic"], null) == null ? [] : local.m622["datastore_statistic"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m622["parent"], null) == null ? [] : local.m622["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m622["permission_resources"], null) == null ? [] : local.m622["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_cluster" {
    for_each = try(local.m622["src_cluster"], null) == null ? [] : local.m622["src_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m622["tags"], null) == null ? [] : local.m622["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tgt_cluster" {
    for_each = try(local.m622["tgt_cluster"], null) == null ? [] : local.m622["tgt_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m622["version_context"], null) == null ? [] : local.m622["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
