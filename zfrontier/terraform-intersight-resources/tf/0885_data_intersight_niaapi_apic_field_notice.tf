# Sample data source intersight_niaapi_apic_field_notice — reads ../models/data_intersight_niaapi_apic_field_notice.yml
locals { m885 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_apic_field_notice.yml"))["data_intersight_niaapi_apic_field_notice"] }

data "intersight_niaapi_apic_field_notice" "n885" {
  account_moid = try(local.m885["account_moid"], null)
  additional_properties = try(local.m885["additional_properties"], null)
  bugid = try(local.m885["bugid"], null)
  class_id = try(local.m885["class_id"], null)
  create_time = try(local.m885["create_time"], null)
  domain_group_moid = try(local.m885["domain_group_moid"], null)
  field_notice_desc = try(local.m885["field_notice_desc"], null)
  field_notice_id = try(local.m885["field_notice_id"], null)
  field_notice_url = try(local.m885["field_notice_url"], null)
  headline = try(local.m885["headline"], null)
  hwpid = try(local.m885["hwpid"], null)
  id = try(local.m885["id"], null)
  mod_time = try(local.m885["mod_time"], null)
  moid = try(local.m885["moid"], null)
  object_type = try(local.m885["object_type"], null)
  owners = try(local.m885["owners"], null)
  results = try(local.m885["results"], null)
  shared_scope = try(local.m885["shared_scope"], null)
  sw_release = try(local.m885["sw_release"], null)
  workaround_url = try(local.m885["workaround_url"], null)
  dynamic "ancestors" {
    for_each = try(local.m885["ancestors"], null) == null ? [] : local.m885["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m885["parent"], null) == null ? [] : local.m885["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m885["permission_resources"], null) == null ? [] : local.m885["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "revision_info" {
    for_each = try(local.m885["revision_info"], null) == null ? [] : local.m885["revision_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m885["tags"], null) == null ? [] : local.m885["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m885["version_context"], null) == null ? [] : local.m885["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
