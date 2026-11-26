# Sample data source intersight_storage_net_app_cifs_share — reads ../models/data_intersight_storage_net_app_cifs_share.yml
locals { m1264 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_cifs_share.yml"))["data_intersight_storage_net_app_cifs_share"] }

data "intersight_storage_net_app_cifs_share" "n1264" {
  account_moid = try(local.m1264["account_moid"], null)
  additional_properties = try(local.m1264["additional_properties"], null)
  class_id = try(local.m1264["class_id"], null)
  comment = try(local.m1264["comment"], null)
  create_time = try(local.m1264["create_time"], null)
  domain_group_moid = try(local.m1264["domain_group_moid"], null)
  encryption = try(local.m1264["encryption"], null)
  home_directory = try(local.m1264["home_directory"], null)
  id = try(local.m1264["id"], null)
  mod_time = try(local.m1264["mod_time"], null)
  moid = try(local.m1264["moid"], null)
  name = try(local.m1264["name"], null)
  object_type = try(local.m1264["object_type"], null)
  owners = try(local.m1264["owners"], null)
  path = try(local.m1264["path"], null)
  results = try(local.m1264["results"], null)
  shared_scope = try(local.m1264["shared_scope"], null)
  svm_name = try(local.m1264["svm_name"], null)
  svm_uuid = try(local.m1264["svm_uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1264["ancestors"], null) == null ? [] : local.m1264["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "net_app_cifs_acl" {
    for_each = try(local.m1264["net_app_cifs_acl"], null) == null ? [] : local.m1264["net_app_cifs_acl"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1264["parent"], null) == null ? [] : local.m1264["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1264["permission_resources"], null) == null ? [] : local.m1264["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_container" {
    for_each = try(local.m1264["storage_container"], null) == null ? [] : local.m1264["storage_container"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1264["tags"], null) == null ? [] : local.m1264["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1264["tenant"], null) == null ? [] : local.m1264["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1264["version_context"], null) == null ? [] : local.m1264["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
