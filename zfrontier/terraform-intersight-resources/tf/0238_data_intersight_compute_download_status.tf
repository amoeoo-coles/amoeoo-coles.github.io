# Sample data source intersight_compute_download_status — reads ../models/data_intersight_compute_download_status.yml
locals { m238 = yamldecode(file("${path.module}/../models/data_intersight_compute_download_status.yml"))["data_intersight_compute_download_status"] }

data "intersight_compute_download_status" "n238" {
  account_moid = try(local.m238["account_moid"], null)
  additional_properties = try(local.m238["additional_properties"], null)
  class_id = try(local.m238["class_id"], null)
  create_time = try(local.m238["create_time"], null)
  domain_group_moid = try(local.m238["domain_group_moid"], null)
  download_error = try(local.m238["download_error"], null)
  download_message = try(local.m238["download_message"], null)
  download_percentage = try(local.m238["download_percentage"], null)
  download_progress = try(local.m238["download_progress"], null)
  download_retries = try(local.m238["download_retries"], null)
  download_stage = try(local.m238["download_stage"], null)
  id = try(local.m238["id"], null)
  mod_time = try(local.m238["mod_time"], null)
  moid = try(local.m238["moid"], null)
  object_type = try(local.m238["object_type"], null)
  owners = try(local.m238["owners"], null)
  results = try(local.m238["results"], null)
  sd_card_download_error = try(local.m238["sd_card_download_error"], null)
  shared_scope = try(local.m238["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m238["ancestors"], null) == null ? [] : local.m238["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "checksum" {
    for_each = try(local.m238["checksum"], null) == null ? [] : local.m238["checksum"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host_op" {
    for_each = try(local.m238["host_op"], null) == null ? [] : local.m238["host_op"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "migration_key_details" {
    for_each = try(local.m238["migration_key_details"], null) == null ? [] : local.m238["migration_key_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m238["parent"], null) == null ? [] : local.m238["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m238["permission_resources"], null) == null ? [] : local.m238["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m238["tags"], null) == null ? [] : local.m238["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m238["version_context"], null) == null ? [] : local.m238["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow" {
    for_each = try(local.m238["workflow"], null) == null ? [] : local.m238["workflow"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
