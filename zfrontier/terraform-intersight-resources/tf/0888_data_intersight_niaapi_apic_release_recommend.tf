# Sample data source intersight_niaapi_apic_release_recommend — reads ../models/data_intersight_niaapi_apic_release_recommend.yml
locals { m888 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_apic_release_recommend.yml"))["data_intersight_niaapi_apic_release_recommend"] }

data "intersight_niaapi_apic_release_recommend" "n888" {
  account_moid = try(local.m888["account_moid"], null)
  additional_properties = try(local.m888["additional_properties"], null)
  class_id = try(local.m888["class_id"], null)
  cll = try(local.m888["cll"], null)
  create_time = try(local.m888["create_time"], null)
  crr = try(local.m888["crr"], null)
  domain_group_moid = try(local.m888["domain_group_moid"], null)
  id = try(local.m888["id"], null)
  mod_time = try(local.m888["mod_time"], null)
  moid = try(local.m888["moid"], null)
  object_type = try(local.m888["object_type"], null)
  owners = try(local.m888["owners"], null)
  pid = try(local.m888["pid"], null)
  results = try(local.m888["results"], null)
  shared_scope = try(local.m888["shared_scope"], null)
  ull = try(local.m888["ull"], null)
  dynamic "ancestors" {
    for_each = try(local.m888["ancestors"], null) == null ? [] : local.m888["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m888["parent"], null) == null ? [] : local.m888["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m888["permission_resources"], null) == null ? [] : local.m888["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m888["tags"], null) == null ? [] : local.m888["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m888["version_context"], null) == null ? [] : local.m888["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
