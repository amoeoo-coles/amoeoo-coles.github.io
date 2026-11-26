# Sample data source intersight_iwotenant_tenant_customization — reads ../models/data_intersight_iwotenant_tenant_customization.yml
locals { m777 = yamldecode(file("${path.module}/../models/data_intersight_iwotenant_tenant_customization.yml"))["data_intersight_iwotenant_tenant_customization"] }

data "intersight_iwotenant_tenant_customization" "n777" {
  account_moid = try(local.m777["account_moid"], null)
  additional_properties = try(local.m777["additional_properties"], null)
  class_id = try(local.m777["class_id"], null)
  create_time = try(local.m777["create_time"], null)
  domain_group_moid = try(local.m777["domain_group_moid"], null)
  enable_data_extractor = try(local.m777["enable_data_extractor"], null)
  id = try(local.m777["id"], null)
  is_write_user_access_key_id_set = try(local.m777["is_write_user_access_key_id_set"], null)
  is_write_user_secret_access_key_set = try(var.secrets["data_intersight_iwotenant_tenant_customization.is_write_user_secret_access_key_set"], local.m777["is_write_user_secret_access_key_set"])
  iwo_id = try(local.m777["iwo_id"], null)
  mod_time = try(local.m777["mod_time"], null)
  moid = try(local.m777["moid"], null)
  msk_server_for_data_extractor = try(local.m777["msk_server_for_data_extractor"], null)
  object_type = try(local.m777["object_type"], null)
  owners = try(local.m777["owners"], null)
  results = try(local.m777["results"], null)
  shared_scope = try(local.m777["shared_scope"], null)
  write_user_access_key_id = try(local.m777["write_user_access_key_id"], null)
  write_user_secret_access_key = try(var.secrets["data_intersight_iwotenant_tenant_customization.write_user_secret_access_key"], local.m777["write_user_secret_access_key"])
  dynamic "account" {
    for_each = try(local.m777["account"], null) == null ? [] : local.m777["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m777["ancestors"], null) == null ? [] : local.m777["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m777["parent"], null) == null ? [] : local.m777["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m777["permission_resources"], null) == null ? [] : local.m777["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m777["tags"], null) == null ? [] : local.m777["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m777["version_context"], null) == null ? [] : local.m777["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
