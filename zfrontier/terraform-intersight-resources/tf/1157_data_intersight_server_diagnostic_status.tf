# Sample data source intersight_server_diagnostic_status — reads ../models/data_intersight_server_diagnostic_status.yml
locals { m1157 = yamldecode(file("${path.module}/../models/data_intersight_server_diagnostic_status.yml"))["data_intersight_server_diagnostic_status"] }

data "intersight_server_diagnostic_status" "n1157" {
  account_moid = try(local.m1157["account_moid"], null)
  additional_properties = try(local.m1157["additional_properties"], null)
  class_id = try(local.m1157["class_id"], null)
  create_time = try(local.m1157["create_time"], null)
  diagnostics_type = try(local.m1157["diagnostics_type"], null)
  domain_group_moid = try(local.m1157["domain_group_moid"], null)
  download_error = try(local.m1157["download_error"], null)
  download_message = try(local.m1157["download_message"], null)
  download_percentage = try(local.m1157["download_percentage"], null)
  download_progress = try(local.m1157["download_progress"], null)
  download_retries = try(local.m1157["download_retries"], null)
  download_stage = try(local.m1157["download_stage"], null)
  id = try(local.m1157["id"], null)
  mod_time = try(local.m1157["mod_time"], null)
  moid = try(local.m1157["moid"], null)
  name = try(local.m1157["name"], null)
  object_type = try(local.m1157["object_type"], null)
  overall_state = try(local.m1157["overall_state"], null)
  owners = try(local.m1157["owners"], null)
  progress = try(local.m1157["progress"], null)
  results = try(local.m1157["results"], null)
  sd_card_download_error = try(local.m1157["sd_card_download_error"], null)
  shared_scope = try(local.m1157["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1157["ancestors"], null) == null ? [] : local.m1157["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "checksum" {
    for_each = try(local.m1157["checksum"], null) == null ? [] : local.m1157["checksum"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "diagnostics" {
    for_each = try(local.m1157["diagnostics"], null) == null ? [] : local.m1157["diagnostics"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1157["parent"], null) == null ? [] : local.m1157["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1157["permission_resources"], null) == null ? [] : local.m1157["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "result" {
    for_each = try(local.m1157["result"], null) == null ? [] : local.m1157["result"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m1157["server"], null) == null ? [] : local.m1157["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1157["tags"], null) == null ? [] : local.m1157["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1157["version_context"], null) == null ? [] : local.m1157["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow" {
    for_each = try(local.m1157["workflow"], null) == null ? [] : local.m1157["workflow"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
