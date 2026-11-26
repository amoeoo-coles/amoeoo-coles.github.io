# Sample data source intersight_storage_net_app_storage_vm — reads ../models/data_intersight_storage_net_app_storage_vm.yml
locals { m1301 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_storage_vm.yml"))["data_intersight_storage_net_app_storage_vm"] }

data "intersight_storage_net_app_storage_vm" "n1301" {
  account_moid = try(local.m1301["account_moid"], null)
  additional_properties = try(local.m1301["additional_properties"], null)
  aggregates = try(local.m1301["aggregates"], null)
  cifs_enabled = try(local.m1301["cifs_enabled"], null)
  class_id = try(local.m1301["class_id"], null)
  create_time = try(local.m1301["create_time"], null)
  dns_domains = try(local.m1301["dns_domains"], null)
  domain_group_moid = try(local.m1301["domain_group_moid"], null)
  fcp_enabled = try(local.m1301["fcp_enabled"], null)
  id = try(local.m1301["id"], null)
  ipspace = try(local.m1301["ipspace"], null)
  is_protected = try(local.m1301["is_protected"], null)
  iscsi_enabled = try(local.m1301["iscsi_enabled"], null)
  key = try(var.secrets["data_intersight_storage_net_app_storage_vm.key"], local.m1301["key"])
  mod_time = try(local.m1301["mod_time"], null)
  moid = try(local.m1301["moid"], null)
  name = try(local.m1301["name"], null)
  name_servers = try(local.m1301["name_servers"], null)
  native_fpolicy_count = try(local.m1301["native_fpolicy_count"], null)
  nfs_enabled = try(local.m1301["nfs_enabled"], null)
  nvme_enabled = try(local.m1301["nvme_enabled"], null)
  object_type = try(local.m1301["object_type"], null)
  owners = try(local.m1301["owners"], null)
  results = try(local.m1301["results"], null)
  shared_scope = try(local.m1301["shared_scope"], null)
  state = try(local.m1301["state"], null)
  subtype = try(local.m1301["subtype"], null)
  uuid = try(local.m1301["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1301["ancestors"], null) == null ? [] : local.m1301["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1301["array"], null) == null ? [] : local.m1301["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "avg_performance_metrics" {
    for_each = try(local.m1301["avg_performance_metrics"], null) == null ? [] : local.m1301["avg_performance_metrics"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disk_pool" {
    for_each = try(local.m1301["disk_pool"], null) == null ? [] : local.m1301["disk_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "events" {
    for_each = try(local.m1301["events"], null) == null ? [] : local.m1301["events"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1301["parent"], null) == null ? [] : local.m1301["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1301["permission_resources"], null) == null ? [] : local.m1301["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1301["tags"], null) == null ? [] : local.m1301["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1301["version_context"], null) == null ? [] : local.m1301["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
