# Sample data source intersight_storage_net_app_cifs_service — reads ../models/data_intersight_storage_net_app_cifs_service.yml
locals { m1263 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_cifs_service.yml"))["data_intersight_storage_net_app_cifs_service"] }

data "intersight_storage_net_app_cifs_service" "n1263" {
  account_moid = try(local.m1263["account_moid"], null)
  active_directory_fqdn = try(local.m1263["active_directory_fqdn"], null)
  ad_organizational_unit = try(local.m1263["ad_organizational_unit"], null)
  additional_properties = try(local.m1263["additional_properties"], null)
  class_id = try(local.m1263["class_id"], null)
  comment = try(local.m1263["comment"], null)
  create_time = try(local.m1263["create_time"], null)
  domain_group_moid = try(local.m1263["domain_group_moid"], null)
  enabled = try(local.m1263["enabled"], null)
  id = try(local.m1263["id"], null)
  mod_time = try(local.m1263["mod_time"], null)
  moid = try(local.m1263["moid"], null)
  object_type = try(local.m1263["object_type"], null)
  owners = try(local.m1263["owners"], null)
  results = try(local.m1263["results"], null)
  server_name = try(local.m1263["server_name"], null)
  shared_scope = try(local.m1263["shared_scope"], null)
  svm_name = try(local.m1263["svm_name"], null)
  svm_uuid = try(local.m1263["svm_uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1263["ancestors"], null) == null ? [] : local.m1263["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1263["parent"], null) == null ? [] : local.m1263["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1263["permission_resources"], null) == null ? [] : local.m1263["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1263["tags"], null) == null ? [] : local.m1263["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1263["tenant"], null) == null ? [] : local.m1263["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1263["version_context"], null) == null ? [] : local.m1263["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
