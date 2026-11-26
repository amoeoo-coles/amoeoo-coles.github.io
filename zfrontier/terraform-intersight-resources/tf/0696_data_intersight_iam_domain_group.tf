# Sample data source intersight_iam_domain_group — reads ../models/data_intersight_iam_domain_group.yml
locals { m696 = yamldecode(file("${path.module}/../models/data_intersight_iam_domain_group.yml"))["data_intersight_iam_domain_group"] }

data "intersight_iam_domain_group" "n696" {
  account_moid = try(local.m696["account_moid"], null)
  additional_properties = try(local.m696["additional_properties"], null)
  class_id = try(local.m696["class_id"], null)
  create_time = try(local.m696["create_time"], null)
  domain_group_moid = try(local.m696["domain_group_moid"], null)
  id = try(local.m696["id"], null)
  mod_time = try(local.m696["mod_time"], null)
  moid = try(local.m696["moid"], null)
  name = try(local.m696["name"], null)
  object_type = try(local.m696["object_type"], null)
  owners = try(local.m696["owners"], null)
  partition1 = try(local.m696["partition1"], null)
  partition2 = try(local.m696["partition2"], null)
  partition3 = try(local.m696["partition3"], null)
  partition_key = try(var.secrets["data_intersight_iam_domain_group.partition_key"], local.m696["partition_key"])
  results = try(local.m696["results"], null)
  shared_scope = try(local.m696["shared_scope"], null)
  usage = try(local.m696["usage"], null)
  dynamic "account" {
    for_each = try(local.m696["account"], null) == null ? [] : local.m696["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m696["ancestors"], null) == null ? [] : local.m696["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m696["parent"], null) == null ? [] : local.m696["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m696["permission_resources"], null) == null ? [] : local.m696["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m696["tags"], null) == null ? [] : local.m696["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m696["version_context"], null) == null ? [] : local.m696["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
