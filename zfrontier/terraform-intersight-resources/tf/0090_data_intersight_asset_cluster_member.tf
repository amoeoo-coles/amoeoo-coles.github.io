# Sample data source intersight_asset_cluster_member — reads ../models/data_intersight_asset_cluster_member.yml
locals { m090 = yamldecode(file("${path.module}/../models/data_intersight_asset_cluster_member.yml"))["data_intersight_asset_cluster_member"] }

data "intersight_asset_cluster_member" "n090" {
  account_moid = try(local.m090["account_moid"], null)
  additional_properties = try(local.m090["additional_properties"], null)
  api_version = try(local.m090["api_version"], null)
  app_partition_number = try(local.m090["app_partition_number"], null)
  class_id = try(local.m090["class_id"], null)
  connected_host = try(local.m090["connected_host"], null)
  connection_id = try(local.m090["connection_id"], null)
  connection_reason = try(local.m090["connection_reason"], null)
  connection_status = try(local.m090["connection_status"], null)
  connection_status_last_change_time = try(local.m090["connection_status_last_change_time"], null)
  connector_version = try(local.m090["connector_version"], null)
  create_time = try(local.m090["create_time"], null)
  device_external_ip_address = try(local.m090["device_external_ip_address"], null)
  domain_group_moid = try(local.m090["domain_group_moid"], null)
  id = try(local.m090["id"], null)
  leadership = try(local.m090["leadership"], null)
  locked_leader = try(local.m090["locked_leader"], null)
  member_identity = try(local.m090["member_identity"], null)
  mod_time = try(local.m090["mod_time"], null)
  moid = try(local.m090["moid"], null)
  object_type = try(local.m090["object_type"], null)
  owners = try(local.m090["owners"], null)
  parent_cluster_member_identity = try(local.m090["parent_cluster_member_identity"], null)
  proxy_app = try(local.m090["proxy_app"], null)
  results = try(local.m090["results"], null)
  shared_scope = try(local.m090["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m090["ancestors"], null) == null ? [] : local.m090["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "connection_flap_status" {
    for_each = try(local.m090["connection_flap_status"], null) == null ? [] : local.m090["connection_flap_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device" {
    for_each = try(local.m090["device"], null) == null ? [] : local.m090["device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m090["parent"], null) == null ? [] : local.m090["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m090["permission_resources"], null) == null ? [] : local.m090["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sudi" {
    for_each = try(local.m090["sudi"], null) == null ? [] : local.m090["sudi"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m090["tags"], null) == null ? [] : local.m090["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m090["version_context"], null) == null ? [] : local.m090["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
