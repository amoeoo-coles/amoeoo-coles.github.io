# Sample data source intersight_firmware_upgrade_status — reads ../models/data_intersight_firmware_upgrade_status.yml
locals { m508 = yamldecode(file("${path.module}/../models/data_intersight_firmware_upgrade_status.yml"))["data_intersight_firmware_upgrade_status"] }

data "intersight_firmware_upgrade_status" "n508" {
  account_moid = try(local.m508["account_moid"], null)
  additional_properties = try(local.m508["additional_properties"], null)
  cache_error = try(local.m508["cache_error"], null)
  cache_message = try(local.m508["cache_message"], null)
  cache_state = try(local.m508["cache_state"], null)
  class_id = try(local.m508["class_id"], null)
  create_time = try(local.m508["create_time"], null)
  domain_group_moid = try(local.m508["domain_group_moid"], null)
  download_error = try(local.m508["download_error"], null)
  download_message = try(local.m508["download_message"], null)
  download_percentage = try(local.m508["download_percentage"], null)
  download_progress = try(local.m508["download_progress"], null)
  download_retries = try(local.m508["download_retries"], null)
  download_stage = try(local.m508["download_stage"], null)
  ep_power_status = try(local.m508["ep_power_status"], null)
  id = try(local.m508["id"], null)
  initial_power_status = try(local.m508["initial_power_status"], null)
  is_cdn_disabled = try(local.m508["is_cdn_disabled"], null)
  mod_time = try(local.m508["mod_time"], null)
  moid = try(local.m508["moid"], null)
  object_type = try(local.m508["object_type"], null)
  overall_error = try(local.m508["overall_error"], null)
  overall_percentage = try(local.m508["overall_percentage"], null)
  overallstatus = try(local.m508["overallstatus"], null)
  owners = try(local.m508["owners"], null)
  pending_type = try(local.m508["pending_type"], null)
  results = try(local.m508["results"], null)
  sd_card_download_error = try(local.m508["sd_card_download_error"], null)
  shared_scope = try(local.m508["shared_scope"], null)
  source_firmware_version = try(local.m508["source_firmware_version"], null)
  target_firmware_version = try(local.m508["target_firmware_version"], null)
  dynamic "ancestors" {
    for_each = try(local.m508["ancestors"], null) == null ? [] : local.m508["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m508["parent"], null) == null ? [] : local.m508["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m508["permission_resources"], null) == null ? [] : local.m508["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m508["tags"], null) == null ? [] : local.m508["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "upgrade" {
    for_each = try(local.m508["upgrade"], null) == null ? [] : local.m508["upgrade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m508["version_context"], null) == null ? [] : local.m508["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow" {
    for_each = try(local.m508["workflow"], null) == null ? [] : local.m508["workflow"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
