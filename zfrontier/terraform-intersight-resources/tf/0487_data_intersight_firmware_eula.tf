# Sample data source intersight_firmware_eula — reads ../models/data_intersight_firmware_eula.yml
locals { m487 = yamldecode(file("${path.module}/../models/data_intersight_firmware_eula.yml"))["data_intersight_firmware_eula"] }

data "intersight_firmware_eula" "n487" {
  accepted = try(local.m487["accepted"], null)
  account_moid = try(local.m487["account_moid"], null)
  additional_properties = try(local.m487["additional_properties"], null)
  class_id = try(local.m487["class_id"], null)
  content = try(local.m487["content"], null)
  create_time = try(local.m487["create_time"], null)
  domain_group_moid = try(local.m487["domain_group_moid"], null)
  eula_accepted = try(local.m487["eula_accepted"], null)
  eula_content = try(local.m487["eula_content"], null)
  id = try(local.m487["id"], null)
  k9_accepted = try(local.m487["k9_accepted"], null)
  k9_content = try(local.m487["k9_content"], null)
  mod_time = try(local.m487["mod_time"], null)
  moid = try(local.m487["moid"], null)
  object_type = try(local.m487["object_type"], null)
  owners = try(local.m487["owners"], null)
  results = try(local.m487["results"], null)
  shared_scope = try(local.m487["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m487["account"], null) == null ? [] : local.m487["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m487["ancestors"], null) == null ? [] : local.m487["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m487["parent"], null) == null ? [] : local.m487["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m487["permission_resources"], null) == null ? [] : local.m487["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m487["tags"], null) == null ? [] : local.m487["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m487["version_context"], null) == null ? [] : local.m487["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
