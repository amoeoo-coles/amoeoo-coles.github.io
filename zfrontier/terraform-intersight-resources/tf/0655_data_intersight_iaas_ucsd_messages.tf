# Sample data source intersight_iaas_ucsd_messages — reads ../models/data_intersight_iaas_ucsd_messages.yml
locals { m655 = yamldecode(file("${path.module}/../models/data_intersight_iaas_ucsd_messages.yml"))["data_intersight_iaas_ucsd_messages"] }

data "intersight_iaas_ucsd_messages" "n655" {
  account_moid = try(local.m655["account_moid"], null)
  additional_properties = try(local.m655["additional_properties"], null)
  class_id = try(local.m655["class_id"], null)
  create_time = try(local.m655["create_time"], null)
  domain_group_moid = try(local.m655["domain_group_moid"], null)
  id = try(local.m655["id"], null)
  mod_time = try(local.m655["mod_time"], null)
  moid = try(local.m655["moid"], null)
  object_type = try(local.m655["object_type"], null)
  owners = try(local.m655["owners"], null)
  results = try(local.m655["results"], null)
  shared_scope = try(local.m655["shared_scope"], null)
  status_id = try(local.m655["status_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m655["ancestors"], null) == null ? [] : local.m655["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m655["parent"], null) == null ? [] : local.m655["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m655["permission_resources"], null) == null ? [] : local.m655["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m655["registered_device"], null) == null ? [] : local.m655["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m655["tags"], null) == null ? [] : local.m655["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m655["version_context"], null) == null ? [] : local.m655["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
