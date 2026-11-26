# Sample data source intersight_techsupportmanagement_tech_support_status — reads ../models/data_intersight_techsupportmanagement_tech_support_status.yml
locals { m1386 = yamldecode(file("${path.module}/../models/data_intersight_techsupportmanagement_tech_support_status.yml"))["data_intersight_techsupportmanagement_tech_support_status"] }

data "intersight_techsupportmanagement_tech_support_status" "n1386" {
  account_moid = try(local.m1386["account_moid"], null)
  additional_properties = try(local.m1386["additional_properties"], null)
  class_id = try(local.m1386["class_id"], null)
  create_time = try(local.m1386["create_time"], null)
  domain_group_moid = try(local.m1386["domain_group_moid"], null)
  file_name = try(local.m1386["file_name"], null)
  file_size = try(local.m1386["file_size"], null)
  id = try(local.m1386["id"], null)
  mod_time = try(local.m1386["mod_time"], null)
  moid = try(local.m1386["moid"], null)
  object_type = try(local.m1386["object_type"], null)
  owners = try(local.m1386["owners"], null)
  reason = try(local.m1386["reason"], null)
  relay_reason = try(local.m1386["relay_reason"], null)
  relay_status = try(local.m1386["relay_status"], null)
  request_ts = try(local.m1386["request_ts"], null)
  results = try(local.m1386["results"], null)
  shared_scope = try(local.m1386["shared_scope"], null)
  status = try(local.m1386["status"], null)
  techsupport_download_url = try(local.m1386["techsupport_download_url"], null)
  user_role = try(local.m1386["user_role"], null)
  dynamic "ancestors" {
    for_each = try(local.m1386["ancestors"], null) == null ? [] : local.m1386["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_member" {
    for_each = try(local.m1386["cluster_member"], null) == null ? [] : local.m1386["cluster_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_registration" {
    for_each = try(local.m1386["device_registration"], null) == null ? [] : local.m1386["device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "origin_resource" {
    for_each = try(local.m1386["origin_resource"], null) == null ? [] : local.m1386["origin_resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1386["parent"], null) == null ? [] : local.m1386["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1386["permission_resources"], null) == null ? [] : local.m1386["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1386["tags"], null) == null ? [] : local.m1386["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tech_support_request" {
    for_each = try(local.m1386["tech_support_request"], null) == null ? [] : local.m1386["tech_support_request"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "techsupport_files" {
    for_each = try(local.m1386["techsupport_files"], null) == null ? [] : local.m1386["techsupport_files"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1386["version_context"], null) == null ? [] : local.m1386["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
