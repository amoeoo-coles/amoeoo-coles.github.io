# Sample data source intersight_storage_net_app_nfs_client — reads ../models/data_intersight_storage_net_app_nfs_client.yml
locals { m1289 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_nfs_client.yml"))["data_intersight_storage_net_app_nfs_client"] }

data "intersight_storage_net_app_nfs_client" "n1289" {
  account_moid = try(local.m1289["account_moid"], null)
  additional_properties = try(local.m1289["additional_properties"], null)
  class_id = try(local.m1289["class_id"], null)
  client_ip = try(local.m1289["client_ip"], null)
  create_time = try(local.m1289["create_time"], null)
  domain_group_moid = try(local.m1289["domain_group_moid"], null)
  id = try(local.m1289["id"], null)
  idle_duration = try(local.m1289["idle_duration"], null)
  mod_time = try(local.m1289["mod_time"], null)
  moid = try(local.m1289["moid"], null)
  object_type = try(local.m1289["object_type"], null)
  owners = try(local.m1289["owners"], null)
  protocol = try(local.m1289["protocol"], null)
  results = try(local.m1289["results"], null)
  server_ip = try(local.m1289["server_ip"], null)
  shared_scope = try(local.m1289["shared_scope"], null)
  svm_name = try(local.m1289["svm_name"], null)
  svm_uuid = try(local.m1289["svm_uuid"], null)
  volume_name = try(local.m1289["volume_name"], null)
  volume_uuid = try(local.m1289["volume_uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1289["ancestors"], null) == null ? [] : local.m1289["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1289["parent"], null) == null ? [] : local.m1289["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1289["permission_resources"], null) == null ? [] : local.m1289["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_container" {
    for_each = try(local.m1289["storage_container"], null) == null ? [] : local.m1289["storage_container"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1289["tags"], null) == null ? [] : local.m1289["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1289["tenant"], null) == null ? [] : local.m1289["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1289["version_context"], null) == null ? [] : local.m1289["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
