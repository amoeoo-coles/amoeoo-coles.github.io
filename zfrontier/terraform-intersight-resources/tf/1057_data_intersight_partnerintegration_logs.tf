# Sample data source intersight_partnerintegration_logs — reads ../models/data_intersight_partnerintegration_logs.yml
locals { m1057 = yamldecode(file("${path.module}/../models/data_intersight_partnerintegration_logs.yml"))["data_intersight_partnerintegration_logs"] }

data "intersight_partnerintegration_logs" "n1057" {
  account_moid = try(local.m1057["account_moid"], null)
  additional_properties = try(local.m1057["additional_properties"], null)
  class_id = try(local.m1057["class_id"], null)
  create_time = try(local.m1057["create_time"], null)
  domain_group_moid = try(local.m1057["domain_group_moid"], null)
  id = try(local.m1057["id"], null)
  mod_time = try(local.m1057["mod_time"], null)
  moid = try(local.m1057["moid"], null)
  object_type = try(local.m1057["object_type"], null)
  owners = try(local.m1057["owners"], null)
  results = try(local.m1057["results"], null)
  shared_scope = try(local.m1057["shared_scope"], null)
  stage = try(local.m1057["stage"], null)
  stderr = try(local.m1057["stderr"], null)
  stdout = try(local.m1057["stdout"], null)
  dynamic "ancestors" {
    for_each = try(local.m1057["ancestors"], null) == null ? [] : local.m1057["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory" {
    for_each = try(local.m1057["inventory"], null) == null ? [] : local.m1057["inventory"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1057["parent"], null) == null ? [] : local.m1057["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1057["permission_resources"], null) == null ? [] : local.m1057["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1057["tags"], null) == null ? [] : local.m1057["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1057["version_context"], null) == null ? [] : local.m1057["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
