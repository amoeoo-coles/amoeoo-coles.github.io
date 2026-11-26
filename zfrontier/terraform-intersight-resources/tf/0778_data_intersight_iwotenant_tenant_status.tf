# Sample data source intersight_iwotenant_tenant_status — reads ../models/data_intersight_iwotenant_tenant_status.yml
locals { m778 = yamldecode(file("${path.module}/../models/data_intersight_iwotenant_tenant_status.yml"))["data_intersight_iwotenant_tenant_status"] }

data "intersight_iwotenant_tenant_status" "n778" {
  account_moid = try(local.m778["account_moid"], null)
  additional_properties = try(local.m778["additional_properties"], null)
  class_id = try(local.m778["class_id"], null)
  create_time = try(local.m778["create_time"], null)
  deploy_status = try(local.m778["deploy_status"], null)
  domain_group_moid = try(local.m778["domain_group_moid"], null)
  id = try(local.m778["id"], null)
  iwo_id = try(local.m778["iwo_id"], null)
  mod_time = try(local.m778["mod_time"], null)
  moid = try(local.m778["moid"], null)
  object_type = try(local.m778["object_type"], null)
  owners = try(local.m778["owners"], null)
  reference_time = try(local.m778["reference_time"], null)
  results = try(local.m778["results"], null)
  shared_scope = try(local.m778["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m778["account"], null) == null ? [] : local.m778["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m778["ancestors"], null) == null ? [] : local.m778["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m778["parent"], null) == null ? [] : local.m778["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m778["permission_resources"], null) == null ? [] : local.m778["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m778["tags"], null) == null ? [] : local.m778["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m778["version_context"], null) == null ? [] : local.m778["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
