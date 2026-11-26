# Sample data source intersight_niaapi_dcnm_cco_post — reads ../models/data_intersight_niaapi_dcnm_cco_post.yml
locals { m890 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_dcnm_cco_post.yml"))["data_intersight_niaapi_dcnm_cco_post"] }

data "intersight_niaapi_dcnm_cco_post" "n890" {
  account_moid = try(local.m890["account_moid"], null)
  additional_properties = try(local.m890["additional_properties"], null)
  class_id = try(local.m890["class_id"], null)
  create_time = try(local.m890["create_time"], null)
  domain_group_moid = try(local.m890["domain_group_moid"], null)
  id = try(local.m890["id"], null)
  mod_time = try(local.m890["mod_time"], null)
  moid = try(local.m890["moid"], null)
  object_type = try(local.m890["object_type"], null)
  owners = try(local.m890["owners"], null)
  post_date = try(local.m890["post_date"], null)
  post_type = try(local.m890["post_type"], null)
  postid = try(local.m890["postid"], null)
  results = try(local.m890["results"], null)
  revision = try(local.m890["revision"], null)
  shared_scope = try(local.m890["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m890["ancestors"], null) == null ? [] : local.m890["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m890["parent"], null) == null ? [] : local.m890["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m890["permission_resources"], null) == null ? [] : local.m890["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "post_detail" {
    for_each = try(local.m890["post_detail"], null) == null ? [] : local.m890["post_detail"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m890["tags"], null) == null ? [] : local.m890["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m890["version_context"], null) == null ? [] : local.m890["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
