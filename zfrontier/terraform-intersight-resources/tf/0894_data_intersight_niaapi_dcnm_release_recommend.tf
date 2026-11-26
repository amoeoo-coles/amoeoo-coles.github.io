# Sample data source intersight_niaapi_dcnm_release_recommend — reads ../models/data_intersight_niaapi_dcnm_release_recommend.yml
locals { m894 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_dcnm_release_recommend.yml"))["data_intersight_niaapi_dcnm_release_recommend"] }

data "intersight_niaapi_dcnm_release_recommend" "n894" {
  account_moid = try(local.m894["account_moid"], null)
  additional_properties = try(local.m894["additional_properties"], null)
  class_id = try(local.m894["class_id"], null)
  cll = try(local.m894["cll"], null)
  create_time = try(local.m894["create_time"], null)
  crr = try(local.m894["crr"], null)
  domain_group_moid = try(local.m894["domain_group_moid"], null)
  id = try(local.m894["id"], null)
  mod_time = try(local.m894["mod_time"], null)
  moid = try(local.m894["moid"], null)
  object_type = try(local.m894["object_type"], null)
  owners = try(local.m894["owners"], null)
  pid = try(local.m894["pid"], null)
  results = try(local.m894["results"], null)
  shared_scope = try(local.m894["shared_scope"], null)
  ull = try(local.m894["ull"], null)
  dynamic "ancestors" {
    for_each = try(local.m894["ancestors"], null) == null ? [] : local.m894["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m894["parent"], null) == null ? [] : local.m894["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m894["permission_resources"], null) == null ? [] : local.m894["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m894["tags"], null) == null ? [] : local.m894["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m894["version_context"], null) == null ? [] : local.m894["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
