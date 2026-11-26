# Sample data source intersight_niaapi_apic_latest_maintained_release — reads ../models/data_intersight_niaapi_apic_latest_maintained_release.yml
locals { m887 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_apic_latest_maintained_release.yml"))["data_intersight_niaapi_apic_latest_maintained_release"] }

data "intersight_niaapi_apic_latest_maintained_release" "n887" {
  account_moid = try(local.m887["account_moid"], null)
  additional_properties = try(local.m887["additional_properties"], null)
  class_id = try(local.m887["class_id"], null)
  create_time = try(local.m887["create_time"], null)
  domain_group_moid = try(local.m887["domain_group_moid"], null)
  id = try(local.m887["id"], null)
  maintained_release = try(local.m887["maintained_release"], null)
  mod_time = try(local.m887["mod_time"], null)
  moid = try(local.m887["moid"], null)
  object_type = try(local.m887["object_type"], null)
  owners = try(local.m887["owners"], null)
  results = try(local.m887["results"], null)
  shared_scope = try(local.m887["shared_scope"], null)
  software_release = try(local.m887["software_release"], null)
  version_tag = try(local.m887["version_tag"], null)
  dynamic "ancestors" {
    for_each = try(local.m887["ancestors"], null) == null ? [] : local.m887["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m887["parent"], null) == null ? [] : local.m887["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m887["permission_resources"], null) == null ? [] : local.m887["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m887["tags"], null) == null ? [] : local.m887["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m887["version_context"], null) == null ? [] : local.m887["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
