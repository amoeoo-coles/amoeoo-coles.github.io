# Sample data source intersight_kvm_policy — reads ../models/data_intersight_kvm_policy.yml
locals { m783 = yamldecode(file("${path.module}/../models/data_intersight_kvm_policy.yml"))["data_intersight_kvm_policy"] }

data "intersight_kvm_policy" "n783" {
  account_moid = try(local.m783["account_moid"], null)
  additional_properties = try(local.m783["additional_properties"], null)
  class_id = try(local.m783["class_id"], null)
  create_time = try(local.m783["create_time"], null)
  description = try(local.m783["description"], null)
  domain_group_moid = try(local.m783["domain_group_moid"], null)
  enable_local_server_video = try(local.m783["enable_local_server_video"], null)
  enable_video_encryption = try(local.m783["enable_video_encryption"], null)
  enabled = try(local.m783["enabled"], null)
  id = try(local.m783["id"], null)
  maximum_sessions = try(local.m783["maximum_sessions"], null)
  mod_time = try(local.m783["mod_time"], null)
  moid = try(local.m783["moid"], null)
  name = try(local.m783["name"], null)
  object_type = try(local.m783["object_type"], null)
  owners = try(local.m783["owners"], null)
  remote_port = try(local.m783["remote_port"], null)
  results = try(local.m783["results"], null)
  shared_scope = try(local.m783["shared_scope"], null)
  tunneled_kvm_enabled = try(local.m783["tunneled_kvm_enabled"], null)
  dynamic "ancestors" {
    for_each = try(local.m783["ancestors"], null) == null ? [] : local.m783["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m783["organization"], null) == null ? [] : local.m783["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m783["parent"], null) == null ? [] : local.m783["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m783["permission_resources"], null) == null ? [] : local.m783["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m783["profiles"], null) == null ? [] : local.m783["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m783["tags"], null) == null ? [] : local.m783["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m783["version_context"], null) == null ? [] : local.m783["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
