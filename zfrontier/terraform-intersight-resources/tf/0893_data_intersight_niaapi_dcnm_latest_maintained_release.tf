# Sample data source intersight_niaapi_dcnm_latest_maintained_release — reads ../models/data_intersight_niaapi_dcnm_latest_maintained_release.yml
locals { m893 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_dcnm_latest_maintained_release.yml"))["data_intersight_niaapi_dcnm_latest_maintained_release"] }

data "intersight_niaapi_dcnm_latest_maintained_release" "n893" {
  account_moid = try(local.m893["account_moid"], null)
  additional_properties = try(local.m893["additional_properties"], null)
  class_id = try(local.m893["class_id"], null)
  create_time = try(local.m893["create_time"], null)
  domain_group_moid = try(local.m893["domain_group_moid"], null)
  id = try(local.m893["id"], null)
  maintained_release = try(local.m893["maintained_release"], null)
  mod_time = try(local.m893["mod_time"], null)
  moid = try(local.m893["moid"], null)
  object_type = try(local.m893["object_type"], null)
  owners = try(local.m893["owners"], null)
  results = try(local.m893["results"], null)
  shared_scope = try(local.m893["shared_scope"], null)
  software_release = try(local.m893["software_release"], null)
  version_tag = try(local.m893["version_tag"], null)
  dynamic "ancestors" {
    for_each = try(local.m893["ancestors"], null) == null ? [] : local.m893["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m893["parent"], null) == null ? [] : local.m893["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m893["permission_resources"], null) == null ? [] : local.m893["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m893["tags"], null) == null ? [] : local.m893["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m893["version_context"], null) == null ? [] : local.m893["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
