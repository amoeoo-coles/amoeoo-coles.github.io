# Sample data source intersight_partnerintegration_dc_logs — reads ../models/data_intersight_partnerintegration_dc_logs.yml
locals { m1051 = yamldecode(file("${path.module}/../models/data_intersight_partnerintegration_dc_logs.yml"))["data_intersight_partnerintegration_dc_logs"] }

data "intersight_partnerintegration_dc_logs" "n1051" {
  account_moid = try(local.m1051["account_moid"], null)
  additional_properties = try(local.m1051["additional_properties"], null)
  class_id = try(local.m1051["class_id"], null)
  create_time = try(local.m1051["create_time"], null)
  domain_group_moid = try(local.m1051["domain_group_moid"], null)
  id = try(local.m1051["id"], null)
  mod_time = try(local.m1051["mod_time"], null)
  moid = try(local.m1051["moid"], null)
  object_type = try(local.m1051["object_type"], null)
  owners = try(local.m1051["owners"], null)
  results = try(local.m1051["results"], null)
  shared_scope = try(local.m1051["shared_scope"], null)
  stage = try(local.m1051["stage"], null)
  stderr = try(local.m1051["stderr"], null)
  stdout = try(local.m1051["stdout"], null)
  dynamic "ancestors" {
    for_each = try(local.m1051["ancestors"], null) == null ? [] : local.m1051["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_connector" {
    for_each = try(local.m1051["device_connector"], null) == null ? [] : local.m1051["device_connector"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1051["parent"], null) == null ? [] : local.m1051["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1051["permission_resources"], null) == null ? [] : local.m1051["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1051["tags"], null) == null ? [] : local.m1051["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1051["version_context"], null) == null ? [] : local.m1051["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
