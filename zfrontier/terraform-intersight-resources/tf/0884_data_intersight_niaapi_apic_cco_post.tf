# Sample data source intersight_niaapi_apic_cco_post — reads ../models/data_intersight_niaapi_apic_cco_post.yml
locals { m884 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_apic_cco_post.yml"))["data_intersight_niaapi_apic_cco_post"] }

data "intersight_niaapi_apic_cco_post" "n884" {
  account_moid = try(local.m884["account_moid"], null)
  additional_properties = try(local.m884["additional_properties"], null)
  class_id = try(local.m884["class_id"], null)
  create_time = try(local.m884["create_time"], null)
  domain_group_moid = try(local.m884["domain_group_moid"], null)
  id = try(local.m884["id"], null)
  mod_time = try(local.m884["mod_time"], null)
  moid = try(local.m884["moid"], null)
  object_type = try(local.m884["object_type"], null)
  owners = try(local.m884["owners"], null)
  post_date = try(local.m884["post_date"], null)
  post_type = try(local.m884["post_type"], null)
  postid = try(local.m884["postid"], null)
  results = try(local.m884["results"], null)
  revision = try(local.m884["revision"], null)
  shared_scope = try(local.m884["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m884["ancestors"], null) == null ? [] : local.m884["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m884["parent"], null) == null ? [] : local.m884["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m884["permission_resources"], null) == null ? [] : local.m884["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "post_detail" {
    for_each = try(local.m884["post_detail"], null) == null ? [] : local.m884["post_detail"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m884["tags"], null) == null ? [] : local.m884["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m884["version_context"], null) == null ? [] : local.m884["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
