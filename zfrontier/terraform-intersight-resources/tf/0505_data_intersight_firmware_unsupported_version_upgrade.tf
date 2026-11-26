# Sample data source intersight_firmware_unsupported_version_upgrade — reads ../models/data_intersight_firmware_unsupported_version_upgrade.yml
locals { m505 = yamldecode(file("${path.module}/../models/data_intersight_firmware_unsupported_version_upgrade.yml"))["data_intersight_firmware_unsupported_version_upgrade"] }

data "intersight_firmware_unsupported_version_upgrade" "n505" {
  account_moid = try(local.m505["account_moid"], null)
  additional_properties = try(local.m505["additional_properties"], null)
  class_id = try(local.m505["class_id"], null)
  create_time = try(local.m505["create_time"], null)
  domain_group_moid = try(local.m505["domain_group_moid"], null)
  download_error = try(local.m505["download_error"], null)
  download_progress = try(local.m505["download_progress"], null)
  download_retries = try(local.m505["download_retries"], null)
  id = try(local.m505["id"], null)
  mod_time = try(local.m505["mod_time"], null)
  moid = try(local.m505["moid"], null)
  object_type = try(local.m505["object_type"], null)
  owners = try(local.m505["owners"], null)
  results = try(local.m505["results"], null)
  shared_scope = try(local.m505["shared_scope"], null)
  upgrade_status = try(local.m505["upgrade_status"], null)
  dynamic "ancestors" {
    for_each = try(local.m505["ancestors"], null) == null ? [] : local.m505["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "checksum" {
    for_each = try(local.m505["checksum"], null) == null ? [] : local.m505["checksum"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device" {
    for_each = try(local.m505["device"], null) == null ? [] : local.m505["device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributable" {
    for_each = try(local.m505["distributable"], null) == null ? [] : local.m505["distributable"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m505["parent"], null) == null ? [] : local.m505["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m505["permission_resources"], null) == null ? [] : local.m505["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_identity" {
    for_each = try(local.m505["physical_identity"], null) == null ? [] : local.m505["physical_identity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m505["tags"], null) == null ? [] : local.m505["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m505["version_context"], null) == null ? [] : local.m505["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
