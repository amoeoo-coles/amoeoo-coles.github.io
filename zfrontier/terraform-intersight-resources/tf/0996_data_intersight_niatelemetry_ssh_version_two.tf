# Sample data source intersight_niatelemetry_ssh_version_two — reads ../models/data_intersight_niatelemetry_ssh_version_two.yml
locals { m996 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_ssh_version_two.yml"))["data_intersight_niatelemetry_ssh_version_two"] }

data "intersight_niatelemetry_ssh_version_two" "n996" {
  account_moid = try(local.m996["account_moid"], null)
  additional_properties = try(local.m996["additional_properties"], null)
  admin_st = try(local.m996["admin_st"], null)
  class_id = try(local.m996["class_id"], null)
  create_time = try(local.m996["create_time"], null)
  dn = try(local.m996["dn"], null)
  domain_group_moid = try(local.m996["domain_group_moid"], null)
  id = try(local.m996["id"], null)
  mod_time = try(local.m996["mod_time"], null)
  moid = try(local.m996["moid"], null)
  object_type = try(local.m996["object_type"], null)
  owners = try(local.m996["owners"], null)
  password_auth = try(var.secrets["data_intersight_niatelemetry_ssh_version_two.password_auth"], local.m996["password_auth"])
  record_type = try(local.m996["record_type"], null)
  record_version = try(local.m996["record_version"], null)
  results = try(local.m996["results"], null)
  shared_scope = try(local.m996["shared_scope"], null)
  site_name = try(local.m996["site_name"], null)
  ssh_ciphers = try(local.m996["ssh_ciphers"], null)
  ssh_macs = try(local.m996["ssh_macs"], null)
  dynamic "ancestors" {
    for_each = try(local.m996["ancestors"], null) == null ? [] : local.m996["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m996["parent"], null) == null ? [] : local.m996["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m996["permission_resources"], null) == null ? [] : local.m996["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m996["registered_device"], null) == null ? [] : local.m996["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m996["tags"], null) == null ? [] : local.m996["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m996["version_context"], null) == null ? [] : local.m996["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
