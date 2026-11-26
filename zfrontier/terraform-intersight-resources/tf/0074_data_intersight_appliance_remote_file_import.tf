# Sample data source intersight_appliance_remote_file_import — reads ../models/data_intersight_appliance_remote_file_import.yml
locals { m074 = yamldecode(file("${path.module}/../models/data_intersight_appliance_remote_file_import.yml"))["data_intersight_appliance_remote_file_import"] }

data "intersight_appliance_remote_file_import" "n074" {
  account_moid = try(local.m074["account_moid"], null)
  additional_properties = try(local.m074["additional_properties"], null)
  class_id = try(local.m074["class_id"], null)
  create_time = try(local.m074["create_time"], null)
  domain_group_moid = try(local.m074["domain_group_moid"], null)
  filename = try(local.m074["filename"], null)
  hostname = try(local.m074["hostname"], null)
  id = try(local.m074["id"], null)
  is_password_set = try(var.secrets["data_intersight_appliance_remote_file_import.is_password_set"], local.m074["is_password_set"])
  mod_time = try(local.m074["mod_time"], null)
  moid = try(local.m074["moid"], null)
  object_type = try(local.m074["object_type"], null)
  owners = try(local.m074["owners"], null)
  password = try(var.secrets["data_intersight_appliance_remote_file_import.password"], local.m074["password"])
  path = try(local.m074["path"], null)
  port = try(local.m074["port"], null)
  protocol = try(local.m074["protocol"], null)
  results = try(local.m074["results"], null)
  shared_scope = try(local.m074["shared_scope"], null)
  username = try(local.m074["username"], null)
  dynamic "account" {
    for_each = try(local.m074["account"], null) == null ? [] : local.m074["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m074["ancestors"], null) == null ? [] : local.m074["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m074["parent"], null) == null ? [] : local.m074["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m074["permission_resources"], null) == null ? [] : local.m074["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m074["tags"], null) == null ? [] : local.m074["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m074["version_context"], null) == null ? [] : local.m074["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
