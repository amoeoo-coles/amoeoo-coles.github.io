# Sample data source intersight_firmware_upgrade — reads ../models/data_intersight_firmware_upgrade.yml
locals { m506 = yamldecode(file("${path.module}/../models/data_intersight_firmware_upgrade.yml"))["data_intersight_firmware_upgrade"] }

data "intersight_firmware_upgrade" "n506" {
  account_moid = try(local.m506["account_moid"], null)
  additional_properties = try(local.m506["additional_properties"], null)
  class_id = try(local.m506["class_id"], null)
  create_time = try(local.m506["create_time"], null)
  domain_group_moid = try(local.m506["domain_group_moid"], null)
  exclude_component_list = try(local.m506["exclude_component_list"], null)
  id = try(local.m506["id"], null)
  mod_time = try(local.m506["mod_time"], null)
  moid = try(local.m506["moid"], null)
  object_type = try(local.m506["object_type"], null)
  owners = try(local.m506["owners"], null)
  results = try(local.m506["results"], null)
  server_name = try(local.m506["server_name"], null)
  shared_scope = try(local.m506["shared_scope"], null)
  skip_estimate_impact = try(local.m506["skip_estimate_impact"], null)
  status = try(local.m506["status"], null)
  upgrade_trigger_method = try(local.m506["upgrade_trigger_method"], null)
  upgrade_type = try(local.m506["upgrade_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m506["ancestors"], null) == null ? [] : local.m506["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device" {
    for_each = try(local.m506["device"], null) == null ? [] : local.m506["device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "direct_download" {
    for_each = try(local.m506["direct_download"], null) == null ? [] : local.m506["direct_download"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributable" {
    for_each = try(local.m506["distributable"], null) == null ? [] : local.m506["distributable"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "exclude_component_pid_list" {
    for_each = try(local.m506["exclude_component_pid_list"], null) == null ? [] : local.m506["exclude_component_pid_list"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "file_server" {
    for_each = try(local.m506["file_server"], null) == null ? [] : local.m506["file_server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_share" {
    for_each = try(local.m506["network_share"], null) == null ? [] : local.m506["network_share"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m506["parent"], null) == null ? [] : local.m506["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m506["permission_resources"], null) == null ? [] : local.m506["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "release" {
    for_each = try(local.m506["release"], null) == null ? [] : local.m506["release"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m506["server"], null) == null ? [] : local.m506["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m506["tags"], null) == null ? [] : local.m506["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "upgrade_impact" {
    for_each = try(local.m506["upgrade_impact"], null) == null ? [] : local.m506["upgrade_impact"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "upgrade_status" {
    for_each = try(local.m506["upgrade_status"], null) == null ? [] : local.m506["upgrade_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m506["version_context"], null) == null ? [] : local.m506["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
