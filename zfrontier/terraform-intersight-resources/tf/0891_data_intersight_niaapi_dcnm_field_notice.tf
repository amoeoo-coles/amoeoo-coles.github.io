# Sample data source intersight_niaapi_dcnm_field_notice — reads ../models/data_intersight_niaapi_dcnm_field_notice.yml
locals { m891 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_dcnm_field_notice.yml"))["data_intersight_niaapi_dcnm_field_notice"] }

data "intersight_niaapi_dcnm_field_notice" "n891" {
  account_moid = try(local.m891["account_moid"], null)
  additional_properties = try(local.m891["additional_properties"], null)
  bugid = try(local.m891["bugid"], null)
  class_id = try(local.m891["class_id"], null)
  create_time = try(local.m891["create_time"], null)
  domain_group_moid = try(local.m891["domain_group_moid"], null)
  field_notice_desc = try(local.m891["field_notice_desc"], null)
  field_notice_id = try(local.m891["field_notice_id"], null)
  field_notice_url = try(local.m891["field_notice_url"], null)
  headline = try(local.m891["headline"], null)
  hwpid = try(local.m891["hwpid"], null)
  id = try(local.m891["id"], null)
  mod_time = try(local.m891["mod_time"], null)
  moid = try(local.m891["moid"], null)
  object_type = try(local.m891["object_type"], null)
  owners = try(local.m891["owners"], null)
  results = try(local.m891["results"], null)
  shared_scope = try(local.m891["shared_scope"], null)
  sw_release = try(local.m891["sw_release"], null)
  workaround_url = try(local.m891["workaround_url"], null)
  dynamic "ancestors" {
    for_each = try(local.m891["ancestors"], null) == null ? [] : local.m891["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m891["parent"], null) == null ? [] : local.m891["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m891["permission_resources"], null) == null ? [] : local.m891["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "revision_info" {
    for_each = try(local.m891["revision_info"], null) == null ? [] : local.m891["revision_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m891["tags"], null) == null ? [] : local.m891["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m891["version_context"], null) == null ? [] : local.m891["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
