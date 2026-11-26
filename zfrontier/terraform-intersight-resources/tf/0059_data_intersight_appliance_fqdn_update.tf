# Sample data source intersight_appliance_fqdn_update — reads ../models/data_intersight_appliance_fqdn_update.yml
locals { m059 = yamldecode(file("${path.module}/../models/data_intersight_appliance_fqdn_update.yml"))["data_intersight_appliance_fqdn_update"] }

data "intersight_appliance_fqdn_update" "n059" {
  account_moid = try(local.m059["account_moid"], null)
  additional_properties = try(local.m059["additional_properties"], null)
  class_id = try(local.m059["class_id"], null)
  create_time = try(local.m059["create_time"], null)
  domain_group_moid = try(local.m059["domain_group_moid"], null)
  end_time = try(local.m059["end_time"], null)
  fqdn = try(local.m059["fqdn"], null)
  id = try(local.m059["id"], null)
  mod_time = try(local.m059["mod_time"], null)
  moid = try(local.m059["moid"], null)
  object_type = try(local.m059["object_type"], null)
  owners = try(local.m059["owners"], null)
  results = try(local.m059["results"], null)
  shared_scope = try(local.m059["shared_scope"], null)
  start_time = try(local.m059["start_time"], null)
  status = try(local.m059["status"], null)
  dynamic "account" {
    for_each = try(local.m059["account"], null) == null ? [] : local.m059["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m059["ancestors"], null) == null ? [] : local.m059["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m059["parent"], null) == null ? [] : local.m059["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m059["permission_resources"], null) == null ? [] : local.m059["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m059["tags"], null) == null ? [] : local.m059["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m059["version_context"], null) == null ? [] : local.m059["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
