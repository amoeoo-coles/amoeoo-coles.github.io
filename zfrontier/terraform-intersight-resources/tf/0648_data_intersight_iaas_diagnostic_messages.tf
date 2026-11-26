# Sample data source intersight_iaas_diagnostic_messages — reads ../models/data_intersight_iaas_diagnostic_messages.yml
locals { m648 = yamldecode(file("${path.module}/../models/data_intersight_iaas_diagnostic_messages.yml"))["data_intersight_iaas_diagnostic_messages"] }

data "intersight_iaas_diagnostic_messages" "n648" {
  account_moid = try(local.m648["account_moid"], null)
  additional_properties = try(local.m648["additional_properties"], null)
  category = try(local.m648["category"], null)
  class_id = try(local.m648["class_id"], null)
  create_time = try(local.m648["create_time"], null)
  domain_group_moid = try(local.m648["domain_group_moid"], null)
  guid = try(local.m648["guid"], null)
  id = try(local.m648["id"], null)
  item = try(local.m648["item"], null)
  last_checked = try(local.m648["last_checked"], null)
  message = try(local.m648["message"], null)
  mod_time = try(local.m648["mod_time"], null)
  moid = try(local.m648["moid"], null)
  object_type = try(local.m648["object_type"], null)
  owners = try(local.m648["owners"], null)
  recommendation = try(local.m648["recommendation"], null)
  results = try(local.m648["results"], null)
  shared_scope = try(local.m648["shared_scope"], null)
  status = try(local.m648["status"], null)
  status_id = try(local.m648["status_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m648["ancestors"], null) == null ? [] : local.m648["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m648["parent"], null) == null ? [] : local.m648["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m648["permission_resources"], null) == null ? [] : local.m648["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m648["registered_device"], null) == null ? [] : local.m648["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m648["tags"], null) == null ? [] : local.m648["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m648["version_context"], null) == null ? [] : local.m648["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
