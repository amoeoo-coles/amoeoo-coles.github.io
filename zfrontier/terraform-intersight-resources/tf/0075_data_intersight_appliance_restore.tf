# Sample data source intersight_appliance_restore — reads ../models/data_intersight_appliance_restore.yml
locals { m075 = yamldecode(file("${path.module}/../models/data_intersight_appliance_restore.yml"))["data_intersight_appliance_restore"] }

data "intersight_appliance_restore" "n075" {
  account_moid = try(local.m075["account_moid"], null)
  additional_properties = try(local.m075["additional_properties"], null)
  class_id = try(local.m075["class_id"], null)
  create_time = try(local.m075["create_time"], null)
  domain_group_moid = try(local.m075["domain_group_moid"], null)
  elapsed_time = try(local.m075["elapsed_time"], null)
  end_time = try(local.m075["end_time"], null)
  filename = try(local.m075["filename"], null)
  id = try(local.m075["id"], null)
  is_password_set = try(var.secrets["data_intersight_appliance_restore.is_password_set"], local.m075["is_password_set"])
  messages = try(local.m075["messages"], null)
  mod_time = try(local.m075["mod_time"], null)
  moid = try(local.m075["moid"], null)
  object_type = try(local.m075["object_type"], null)
  owners = try(local.m075["owners"], null)
  password = try(var.secrets["data_intersight_appliance_restore.password"], local.m075["password"])
  protocol = try(local.m075["protocol"], null)
  remote_host = try(local.m075["remote_host"], null)
  remote_path = try(local.m075["remote_path"], null)
  remote_port = try(local.m075["remote_port"], null)
  results = try(local.m075["results"], null)
  shared_scope = try(local.m075["shared_scope"], null)
  start_time = try(local.m075["start_time"], null)
  status = try(local.m075["status"], null)
  tls_certificate = try(local.m075["tls_certificate"], null)
  url = try(local.m075["url"], null)
  username = try(local.m075["username"], null)
  dynamic "account" {
    for_each = try(local.m075["account"], null) == null ? [] : local.m075["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m075["ancestors"], null) == null ? [] : local.m075["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m075["parent"], null) == null ? [] : local.m075["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m075["permission_resources"], null) == null ? [] : local.m075["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m075["tags"], null) == null ? [] : local.m075["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m075["version_context"], null) == null ? [] : local.m075["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
