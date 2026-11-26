# Sample data source intersight_iam_banner_message — reads ../models/data_intersight_iam_banner_message.yml
locals { m691 = yamldecode(file("${path.module}/../models/data_intersight_iam_banner_message.yml"))["data_intersight_iam_banner_message"] }

data "intersight_iam_banner_message" "n691" {
  account_moid = try(local.m691["account_moid"], null)
  additional_properties = try(local.m691["additional_properties"], null)
  banner_contents = try(local.m691["banner_contents"], null)
  banner_display = try(local.m691["banner_display"], null)
  banner_title = try(local.m691["banner_title"], null)
  class_id = try(local.m691["class_id"], null)
  create_time = try(local.m691["create_time"], null)
  domain_group_moid = try(local.m691["domain_group_moid"], null)
  id = try(local.m691["id"], null)
  mod_time = try(local.m691["mod_time"], null)
  moid = try(local.m691["moid"], null)
  object_type = try(local.m691["object_type"], null)
  owners = try(local.m691["owners"], null)
  results = try(local.m691["results"], null)
  shared_scope = try(local.m691["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m691["account"], null) == null ? [] : local.m691["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m691["ancestors"], null) == null ? [] : local.m691["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m691["parent"], null) == null ? [] : local.m691["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m691["permission_resources"], null) == null ? [] : local.m691["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m691["tags"], null) == null ? [] : local.m691["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m691["version_context"], null) == null ? [] : local.m691["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
